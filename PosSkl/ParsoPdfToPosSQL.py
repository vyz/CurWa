from typing import Dict
import fitz
from Classo import Conta as clConta
import re
import logging
import logging.config
import psycopg2


pdf_document = r"E:\KoPo\Helpo\User_7_0_2_220227.pdf"


def main():
    doc = fitz.open(pdf_document)
    contomaxpage = 5
    vi = 0
    diConto = {}
    kid = 1
    for numo in range(1, doc.pageCount):
        if numo < contomaxpage:
            kk, dico = ParsoContoPage(numo, doc.loadPage(numo))
            if kk > 0:
                contomaxpage = kk
            for key, valo in dico.items():
                valo.ida = kid
                LevNumoCount(valo)
                diConto[key] = valo
                kid += 1
        else:
            vi = numo
            break
    ll = len(diConto)
    logger.info("PDF-файл -> %s", pdf_document)
    logger.debug("Qvo : {} numo : {}".format(ll, numo))
    ContaToBase(diConto, 3)


def ParsoContoPage(numo: int, pago) -> tuple:
    KColontitul = \
        "СПРУТ-ОКП Документация  –  СПРУТ-ОКП Руководство пользователя"
    KContent = "Table of Contents"
    dicto = {}
    reto = -1
    leli = pago.getLinks()
    frox = 0.0
    for elo in leli:
        if frox != elo['from'].bl.y:
            frox = elo['from'].bl.y
            xrefa = elo['xref']
            pigo = elo['page']
            toxo = elo['to'].x
            toyo = elo['to'].y
            refa = clConta.Conta(xrefa=xrefa, frox=frox, fropigo=numo+1,
                                 pigo=pigo+1, toxo=toxo, toyo=toyo)
            dicto[xrefa] = refa
    if leli:
        linko = pago.firstLink
        urolast = ''
        while linko:
            if linko.isExternal:
                uro = linko.uri
                # Нонсенс
                raise RuntimeError("Внешняя ссылка в содержании -> " + uro)
            else:
                uro = linko.uri
                xrefa = linko.xref
                if xrefa in dicto:
                    # Для двухстрочных заголовков надо оставлять один.
                    if uro != urolast:
                        dicto[xrefa].uro = uro
                        urolast = uro
                    else:
                        del dicto[xrefa]
                        logger.debug("Двухстрочный заголовок %s", uro)
            linko = linko.next
    tepa = pago.getTextPage()
    texo = tepa.extractText()
    kk = len(texo)
    if kk > 0:
        ltexo = texo.splitlines()
        kk = len(ltexo)
        assert ltexo[0] == KColontitul
        s1 = ltexo[1]
        pato = r'(\d+)$'
        m1 = re.search(pato, s1)
        searcho = m1.group(0)
        isko = int(searcho)
        assert isko == numo+1
        if kk < 3:
            return(numo, dicto)
        bego = 2
        cike = 0
        likea = list(dicto.keys())
        if ltexo[2] == KContent:
            fikey = likea[0]
            reto = dicto[fikey].pigo - 2
            bego += 1
        while bego < kk:
            fikey = likea[cike]
            s1 = ltexo[bego]
            '''Некоторые строчки не разбиваются после кода,
            а остаются сцепленными. Приходится их разбивать вручную.'''
            rcodo = re.search(r'^[\d.]+$', s1)
            if rcodo is None:
                rbito = re.split(r' ', s1, 1)
                s1 = rbito[0]
                s2 = rbito[1]
                bego -= 1
            else:
                s2 = ltexo[bego+1]
            dicto[fikey].koda = s1
            # Есть заголовки, которые содержат '.' внутри себя
            # Поэтому у разделителя должно быть не меньше 2 точек подряд.
            rbito = re.split(r'\.{2,}', s2)
            if len(rbito) == 1:
                bego += 1
                s2 += ltexo[bego+1]
                rbito = re.split(r'\.{2,}', s2)
            s1 = rbito[0].strip()
            isko = int(rbito[1])
            assert isko == dicto[fikey].pigo
            dicto[fikey].namo = s1
            bego += 2
            cike += 1
    return(reto, dicto)


def LevNumoCount(itmo: clConta.Conta):
    lvo = itmo.koda.split('.')
    itmo.lvl = len(lvo)
    itmo.lnom = lvo[itmo.lvl-1]


def ContaToBase(dinto, refid: int):
    database = "proba"
    user = "ara"
    host = "192.168.0.245"
    port = "5432"
    zquery = """
    INSERT INTO conta (refverso, xrefa, frox, fropigo, pigo, toxo, toyo, uro, koda, lvl, lnom, namo, ida)
    VALUES ({stroka});
    """
    zstroka = "{i1}, {i2}, {r1}, {i3}, {i4}, {r2}, {r3}, '{t1}', '{t2}', {i5}, {i6}, '{t3}', {i7}"
    conn = psycopg2.connect(
            database=database,
            user=user,
            password="",
            host=host,
            port=port
            )
    cursor = conn.cursor()
    for elo in dinto.values():
        ss = zstroka.format(
            i1=refid,
            i2=elo.xrefa,
            r1=elo.frox,
            i3=elo.fropigo,
            i4=elo.pigo,
            r2=elo.toxo,
            r3=elo.toyo,
            t1=elo.uro,
            t2=elo.koda,
            i5=elo.lvl,
            i6=elo.lnom,
            t3=elo.namo,
            i7=elo.ida
            )
        qInsert = zquery.format(stroka=ss)
        cursor.execute(qInsert)
    conn.commit()
    conn.close()


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('PosSkl')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
