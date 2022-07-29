from copy import deepcopy
from encodings import utf_8
import logging
import logging.config
import xml.etree.ElementTree as ET
import pymssql


NlmnsURI = 'http://www.lysator.liu.se/~alla/dia/'
FloTablo = 'ListoTablo.txt'


def main():
    (shabo, conelo, welo) = GetEtreeFromShablon()
    lTabo = GetListoTables()
    tupa = PreparationQuadrants(len(lTabo))
    for (i, w) in enumerate(lTabo):
        pointa = CalcDoubly(tupa, i)
        ttupa = GetTabloFromMSSQLBase(w)
        cura = FillTabloElem(welo, pointa, ttupa)
        cura.set('id', f'O{i:02}')
        conelo.append(cura)
        logger.info("Табла %s", w)
    WriteDiaXML(shabo)


def GetEtreeFromShablon() -> tuple:
    filo = "DiaShaba.xml"
    NSMAP = {'dia': NlmnsURI}
    tree = ET.ElementTree(file=filo)
    root = tree.getroot()
    eLayer = root.find('dia:layer', NSMAP)
    if eLayer.attrib['name'] != 'Фон':
        logger.error("У лайера нет фона %s", repr(eLayer))
    eObject = eLayer.find('dia:object', NSMAP)
    if eObject.attrib['type'] != 'Database - Table':
        logger.error("Объект не таблица БД %s", repr(eObject))
    eTablo = eObject.find("./dia:attribute[@name='attributes']", NSMAP)
    eObject.remove(eTablo)
    eWorko = ET.Element('dia:object',
                        attrib={'type': 'Database - Table',
                                'version': '0'})
    eWorko.extend(eObject.findall('./*', NSMAP))
    eLayer.remove(eObject)
    return (tree, eLayer, eWorko)


def GetListoTables() -> list:
    reto = []
    with open(FloTablo, 'r', encoding='utf-8-sig') as f:
        for line in f:
            stroka = line.strip()
            reto.append(stroka)
    return reto


def PreparationQuadrants(qawa: int) -> tuple:
    Qp = 9
    Ql = 3
    s = int(qawa/9)
    if s <= 4:
        Qx = 18
    elif s <= 9:
        Qx = 27
    else:
        Qx = 36
    return (Qp, Ql, Qx)


def CalcDoubly(tConsto: tuple, i: int) -> tuple:
    (Qp, Ql, Qx) = tConsto
    ix = i % Ql
    iy = int((i % Qp) / Ql)
    qx = int((i % Qx) / Qp)
    qy = int(i / Qx)
    Dx = 0.5 + 6.5*ix + 19.5*qx
    Dy = 0.5 + 8.5*iy + 27.5*qy
    return(Dx, Dy)


def GetTabloFromMSSQLBase(tabo: str) -> tuple:
    server = r"VALKOV\LOPO"
    dbnamo = r"Obslugo"
    srezo = 3
    ConnPropy = """
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET ANSI_NULLS ON;
SET ANSI_NULL_DFLT_ON ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ANSI_NULL_DFLT_ON ON;
SET IMPLICIT_TRANSACTIONS OFF;
SET CURSOR_CLOSE_ON_COMMIT OFF;
SET QUOTED_IDENTIFIER ON;
SET TEXTSIZE 2147483647;
"""
    QuTablo = """
SELECT Id, cast(Descro as nvarchar(1024)) as Commo
FROM tan.Tablo
where Namo = %s
"""
    QuPrKey = """
SELECT PrKey
FROM tan.sTablo
where fTablo = %d and fSrez = %d
"""
    QuFildy = """
SELECT Namo, cast(left(Descro,150) as nvarchar(150)) as Descro, Typo, Dln,
       bNullo FROM tan.sFildy
where fTablo = %d and fSrez = %d
order by Ordin
"""
    conn = pymssql.connect(host=server, database=dbnamo,
                           appname='DiaCreto',
                           conn_properties=ConnPropy)
    curso = conn.cursor(as_dict=True)
    curso.execute(QuTablo, (tabo))
    res = curso.fetchone()
    tida = res['Id']
    tdescro = res['Commo']
    curso.execute(QuPrKey, (tida, srezo))
    res = curso.fetchone()
    stroka = res['PrKey'].split(',')
    curso.execute(QuFildy, (tida, srezo))
    res = curso.fetchall()
    lFld = []
    for z in res:
        fildo = z['Namo']
        descro = z['Descro']
        typo = z['Typo']
        dln = z['Dln']
        bnullo = z['bNullo']
        bkey = fildo in stroka
        if dln > 0 and typo != 'float':
            typo = f"{typo}({dln})"
        lFld.append((fildo, typo, descro, bkey, bnullo))
    curso.close()
    conn.close()
    return ((tabo, tdescro), lFld)


def FillTabloElem(Elem: ET.Element,
                  tPointo: tuple,
                  tTablo: tuple) -> ET.Element:
    NSMAP = {'dia': NlmnsURI}
    (Dx, Dy) = tPointo
    (ttupa, lFld) = tTablo
    (tabo, tdescro) = ttupa
    reto = deepcopy(Elem)
    elpoint = reto.find("./dia:attribute[@name='obj_pos']/dia:point", NSMAP)
    elpoint.attrib['val'] = f"{Dx},{Dy}"
    elrectangle = reto.find("./dia:attribute[@name='obj_bb']/dia:rectangle",
                            NSMAP)
    Ex = Dx + 5.5
    Ey = Dy + 7.5
    elrectangle.attrib['val'] = f"{Dx},{Dy};{Ex},{Ey}"
    elpoint = reto.find("./dia:attribute[@name='elem_corner']/dia:point",
                        NSMAP)
    elpoint.attrib['val'] = f"{Dx},{Dy}"
    ename = reto.find("./dia:attribute[@name='name']/dia:string", NSMAP)
    ename.text = f"#{tabo}#"
    ecomment = reto.find("./dia:attribute[@name='comment']/dia:string", NSMAP)
    ecomment.text = f"#{tdescro}#"
    eTabo = ET.Element('dia:attribute', attrib={'name': 'attributes'})
    for z in lFld:
        (fildo, typo, descro, bkey, bnullo) = z
        eFieldo = ET.Element('dia:composite',
                             attrib={'type': 'table_attribute'})
        # Идентификатор поля
        evan = ET.Element('dia:attribute', attrib={'name': 'name'})
        einner = ET.Element('dia:string')
        einner.text = f"#{fildo}#"
        evan.append(einner)
        eFieldo.append(evan)
        # Тип поля
        evan = ET.Element('dia:attribute', attrib={'name': 'type'})
        einner = ET.Element('dia:string')
        einner.text = f"#{typo}#"
        evan.append(einner)
        eFieldo.append(evan)
        # Описание поля
        evan = ET.Element('dia:attribute', attrib={'name': 'comment'})
        einner = ET.Element('dia:string')
        einner.text = f"#{descro}#"
        evan.append(einner)
        eFieldo.append(evan)
        # Флаг вхождения в первичный ключ
        zstr = 'true' if bkey else 'false'
        evan = ET.Element('dia:attribute', attrib={'name': 'primary_key'})
        einner = ET.Element('dia:boolean', attrib={'val': zstr})
        evan.append(einner)
        eFieldo.append(evan)
        # Флаг возможности принятия значения null
        zstr = 'true' if bnullo else 'false'
        evan = ET.Element('dia:attribute', attrib={'name': 'nullable'})
        einner = ET.Element('dia:boolean', attrib={'val': zstr})
        evan.append(einner)
        eFieldo.append(evan)
        # Флаг уникальности значения всегда заполняем фальшью
        evan = ET.Element('dia:attribute', attrib={'name': 'unique'})
        einner = ET.Element('dia:boolean', attrib={'val': 'false'})
        evan.append(einner)
        eFieldo.append(evan)
        # Добавляем сформированную группу в табличный элемент
        eTabo.append(eFieldo)
    reto.append(eTabo)
    return reto


def WriteDiaXML(Tra: ET.ElementTree):
    ET.register_namespace(prefix='dia', uri=NlmnsURI)
    Tra.write('reso.xml', encoding="UTF-8", xml_declaration=True)


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('DiaCreato')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
