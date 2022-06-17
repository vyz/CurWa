from encodings import utf_8
import logging
import logging.config
import re
import pymssql
from typing import List
import regex
import Classo


flo = 'CREATE_Tables703.sql'
srezo = '7.0.3'
LMsoTypes = ['bigint', 'float', 'varchar', 'datetime', 'int',
             'tinyint', 'bit', 'smallint', 'money', 'char',
             'uniqueidentifier', 'sysname', 'nchar', 'image',
             'varbinary', 'real', 'timestamp', 'ntext', 'text']
DUserTypes = {'dbo.prt_len': 'varchar(5)',
              'dbo.g_code': 'varchar(1)',
              'dbo.d_date': 'datetime',
              'dbo.wrh_len': 'varchar(10)',
              'dbo.wrh_nam': 'varchar(50)',
              'dbo.doc_len': 'varchar(50)',
              'dbo.g_count': 'int',
              'dbo.ccc_len': 'varchar(10)',
              'dbo.art_len': 'varchar(8)',
              'dbo.pin_len': 'varchar(5)',
              'dbo.eiz_len': 'varchar(3)',
              'dbo.g_numb': 'varchar(10)',
              'dbo.g_quant_f': 'float',
              'dbo.g_price': 'money'}
LNewTypes = []


def main():
    minno = ''
    taboname = ''
    commento = ''
    numa = 0
    with open(flo, encoding='cp1251') as f:
        for line in f:
            vix = ''
            if line.lstrip().lower().startswith('create table'):
                if numa > 0:
                    (taboname, topo, downo) = VanTablo(minno)
                    logger.debug("Tablo %s %d", taboname, numa)
                    (fildy, constra) = FieldoParso(topo)
                    oldcom = commento
                    (dTabo, dFildy, commento) = DescriptionParso(downo,
                                                                 taboname)
                    logger.debug("Des->%s", dTabo)
                    for pole in fildy:
                        mipo = pole.Namo.lower()
                        if pole.Namo.lower() in dFildy.keys():
                            pole.Descro = dFildy[mipo]
                    tabo = Classo.Tablo(taboname, dTabo,
                                        ','.join(constra[2]),
                                        constra[1], constra[0], oldcom)
                    SrezoInMSSQLBaseAdd(srezo, tabo, fildy)
                numa += 1
                minno = ''
            minno += line
    logger.info("!!!Новые типы: %s для версии %s", repr(LNewTypes), srezo)


def VanTablo(conto: str) -> tuple:
    pat = r'''
(?<rec> #capturing group rec
    \( #open parenthesis
    (?: #non-capturing group
        [^()]+ #anything but parenthesis one or more times without backtracking
    | #or
    (?&rec) #recursive substitute of group rec
    )*
    \) #close parenthesis
)
'''

    m = regex.search(pat, conto, flags=regex.VERBOSE | regex.MULTILINE)
    if m:
        ro0 = m.group(0)
        g1 = conto.split(ro0)
        tabo = seltaboname(g1[0])
# Определение имени таблицы опущено сюда, потому что
# встречаются скобки прижатые к имени при отсутствующем пробеле
# между именем и скобкой.
# И таких случаев не мало (> 10).
        ro2 = g1[1]
        return (tabo, ro0, ro2)
    else:
        logger.error('VanTablo->Не сработала регулярка')
        return('ERR0', 'ERR1', 'ERR2')


def seltaboname(sinno: str) -> str:
    lwo = sinno.lstrip().split(' ')
    reto = lwo[2].rstrip()
    if reto.lower().startswith('dbo.'):
        reto = Deldbo(reto)
    return reto


def Deldbo(sinno: str) -> str:
    pat = r'dbo.'
    repl = r''
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def FieldoParso(sinno: str) -> tuple:
    '''
    Первые предпосылки:
    Каждое поле определяется в одной строке.
    Увы не сработало (OKP_PLN)
    '''
    fli = []
    ogli = ('', 0, '')
    nabo = sinno.split('\n')
    ordin = 0
    for elo in nabo:
        tt = elo.strip()
        if tt.startswith('(') or tt.startswith(')') or len(tt) == 0:
            continue
        if tt.endswith(','):
            tt = tt[:-1].rstrip()
        clo = SkobkoDav(tt)
        # Вот такой изврат для обхода несбывшейся первой предпосылки
        lstro = clo.split(', ')
        zz = len(lstro)
        if zz > 1:
            logger.info("!!Более одного поля в строке %s", clo)
        for flo in lstro:
            lwo = re.split(r'\s+', flo.strip())
            if lwo[0].lower() == 'constraint' or \
               lwo[0].lower() == 'primary' and lwo[1].lower() == 'key':
                # logger.debug("Constraint %s", flo)
                ogli = ConstraintParso(lwo)
#               logger.debug("CoParso: %s -> %d %s", pName, pQwo, repr(pLiFi))
            else:
                fildo = lwo[0]
                # Дополнительная очистка от квадратных скобок в имени поля.
                if fildo.startswith('[') and fildo.endswith(']'):
                    fildo = fildo[1:-1]
                (mso, dln, fUser, uNamo) = TypoDefo(lwo[1])
                fIdnty = False
                fNullo = True  # Умолчание в MS SQL
                fOgr = False
                fColla = False
                zOgr = ''
                nOgr = ''
                kfa = 0
                for (nn, ewa) in enumerate(lwo[2:]):
                    if kfa > 0:
                        kfa -= 1
                        continue
                    if ewa.lower() == 'not':
                        if lwo[nn+3].lower() == 'null':
                            fNullo = False
                        kfa = 1
                    elif ewa.lower() == 'null':
                        fNullo = True
                    elif ewa.lower() == 'constraint':
                        fOgr = True
                        nOgr = lwo[nn+3]
                        assert(lwo[nn+4].lower().startswith('default'))
                        kfa = 1
                    elif ewa.lower().startswith('default'):
                        fOgr = True
                        if ewa.endswith(')'):
                            dd = ewa.split('(', 1)
                            zOgr = dd[1][:-1].lower()
                        else:
                            zOgr = lwo[nn+3]
                            kfa = 1
                        if zOgr.startswith("'"):
                            if zOgr.endswith("'"):
                                # Очистка от одинарных кавычек
                                # для текстовых умолчаний
                                zOgr = zOgr[1:-1]
                            else:
                                # В кавычках выражение из нескольких слов
                                zOgr = zOgr[1:]
                                for zwo in lwo[nn+4:]:
                                    kfa += 1
                                    if zwo.endswith("'"):
                                        zOgr = zOgr + ' ' + zwo[:-1]
                                        break
                                    else:
                                        zOgr = zOgr + ' ' + zwo
                    elif ewa.lower() == 'collate':
                        fColla = True
                        assert(lwo[nn+3].lower() == 'database_default')
                        kfa = 1
                    elif (ewa.lower() == 'identity(1,1)' or
                          ewa.lower() == 'identity' or
                          ewa.lower() == 'identity(1,10)'):
                        # 10 таблица OKP_NNUM
                        fIdnty = True
                    else:
                        logger.error("Нежданчик -> %s", ewa)
#                logger.debug(
#                 "Fildo: %s -> %s %s %s %s F-> %s N-> %s O-> %s %s %s C-> %s",
#                 fildo, mso, dln, fUser, uNamo, fIdnty, fNullo,
#                 fOgr, nOgr, zOgr, fColla)
                ordin += 1
                curfild = Classo.Fildo(fildo, ordin, '', mso, dln,
                                       fNullo, fIdnty, fOgr, zOgr,
                                       nOgr, fColla, fUser, uNamo)
                fli.append(curfild)
    return(fli, ogli)


def SkobkoDav(sinno: str) -> str:
    '''
    Удалим пробелы внутри скобок и между словом и открывающейся скобкой
    От табуляции не избавляемся:(
    Просто разбивать будем не стринговым сплитом, а регекспным.
    '''
    patin = r'\s+(?=[^()]*\))'
    # Удаление пробелов внутри скобок
    patbefore = r'\s+(?=\()'
    # Удаление пробелов перед скобкой

    odin = re.sub(patin, '', sinno)
    dva = re.sub(patbefore, '', odin)
    return dva


def TypoDefo(sinno: str) -> tuple:
    '''
    Разбираем слово определяющее тип поля БД
    Возвращаем кортеж из 4 переменных
    mso - mssql имя в нижнем регистре
    dln - длина поля, если присутствует в описании (не физическая)
          по-умолчанию 0
    fUser - флаг пользовательскоко типа поля по-умолчанию False
    uNamo - пользовательское имя поля
    '''
    (mso, dln) = SkobkoType(sinno)
    fUser = False
    uNamo = ''
    if mso in DUserTypes.keys():
        fUser = True
        uNamo = mso
        (mso, dln) = SkobkoType(DUserTypes[uNamo])
    if mso not in LMsoTypes:
        if mso not in LNewTypes:
            LNewTypes.append(mso)
    return (mso, dln, fUser, uNamo)


def SkobkoType(sinno: str) -> tuple:
    if sinno.endswith(')'):
        dd = sinno.split('(')
        mso = dd[0].lower()
        zz = dd[1][:-1].lower()
        if zz == 'max':
            dln = 8060
        else:
            dln = int(zz)
    else:
        mso = sinno.lower()
        dln = 0
    return (mso, dln)


def ConstraintParso(lwo: list) -> list:
    '''
    Первые предпосылки:
    Перечень полей всегда в скобках у clustered
    Иногда две закрывающиеся скобки из-за недоочистки
    '''
    pName = ''
    pQwo = 0
    pLiFi = []
    kfa = 0
    for (nn, elo) in enumerate(lwo):
        if kfa > 0:
            kfa -= 1
            continue
        if elo.lower() == 'constraint':
            pName = lwo[nn+1]
            kfa = 1
        elif elo.lower() == 'primary':
            assert(lwo[nn+1].lower() == 'key')
            kfa = 1
        elif elo.lower().startswith('clustered('):
            dd = elo.split('(')
            tt = dd[1][:-1]
            if tt.endswith(')'):
                tt = tt[:-1]
            if ',' in tt:
                pLiFi = tt.split(',')
                pQwo = len(pLiFi)
            else:
                pLiFi.append(tt)
                pQwo = 1
        else:
            logger.error("Нежданчик -> %s", elo)
    return (pName, pQwo, pLiFi)


def DescriptionParso(sinno: str, tabo: str) -> tuple:
    '''
    Первые предпосылки:
    Описание поля бывает и многострочным.
    Оставляем многострочность и обрабатываем её.
    Опираемся на GO и sp_addextendedproperty 'MS_Description'
    GO должно быть отдельным словом -> \\sgo\\s.
    Предполагаем, что sp_addextendedproperty и MS_Description
    находятся в одной строке.
    '''
    dTabo = ''
    dFildy = {}
    commento = ''
    patgo = r'\sgo\s'
    patdes = r"sp_addextendedproperty"
    patelo = r"'(.+?)'"
    bgo = re.split(patgo, sinno, flags=re.MULTILINE | re.IGNORECASE)
    for elo in bgo:
        bdes = re.split(patdes, elo,
                        flags=re.MULTILINE | re.IGNORECASE)
        if len(bdes) > 1:
            for paro in bdes:
                # Перед началом разбиения на части заменим две ''
                # на одну "
                if "''" in paro:
                    paro = paro.replace("''", '"')
                aa = re.findall(patelo, paro, flags=re.MULTILINE | re.DOTALL)
                if aa:
                    laa = len(aa)
                    assert(aa[0].lower() == 'ms_description')
                    assert(aa[4].lower() == 'table')
                    assert(aa[5].lower() == tabo.lower())
                    if laa == 6:
                        # Таблица
                        dTabo = aa[1]
                    elif laa == 8:
                        # Поле
                        assert(aa[6].lower() == 'column')
                        dFildy[aa[7].lower()] = aa[1]
                    else:
                        logger.error("!!НЕжданчик->%d %s", laa, paro)
        else:
            # Ищем комменты двух типов -- и /* */
            patzve = r'/\*.*\*/'
            aa = re.search(patzve, elo, flags=re.MULTILINE | re.DOTALL)
            if aa:
                commento = aa.group()
            else:
                astro = re.split(r'\n', elo)
                for stro in astro:
                    if stro.strip().startswith('--'):
                        a1 = stro.strip()[2:]
                        if commento:
                            commento += r'\n' + a1
                        else:
                            commento = a1
    return (dTabo, dFildy, commento)


def SrezoInMSSQLBaseAdd(srezo: str, tabo: Classo.Tablo, fildy: List):
    server = r"VALKOV\LOPO"
    dbnamo = r"Obslugo"
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
    ProcTablo = """
DECLARE @rSrezo int, @rTablo int
EXEC AddTabloSrez %s, %s, %s, %s, %d, %s, %s, @rSrezo OUT, @rTablo OUT
SELECT @rSrezo, @rTablo
"""
    ProcFieldo = """
EXEC AddFildySrez %d, %d, %s, %d, %s, %s, %d, %d, %d, %d, %s, %s, %d, %d, %s
"""
    conn = pymssql.connect(host=server, database=dbnamo,
                           appname='TabloAnaloy',
                           conn_properties=ConnPropy)
    curso = conn.cursor()
    curso.execute(ProcTablo, (srezo, tabo.Namo, tabo.Descro,
                  tabo.PrKey, tabo.PrQwo, tabo.PrNamo,
                  tabo.Commento))
    res = curso.fetchall()
    rsrez = res[0][0]
    rtabo = res[0][1]
    for po in fildy:
        curso.execute(ProcFieldo, (rsrez, rtabo, po.Namo, po.Ordin,
                      po.Descro, po.Typo, po.Dln, int(po.bNullo),
                      int(po.bIdnty), int(po.bDefo), po.zDefo,
                      po.nDefo, int(po.bColla), int(po.bUser),
                      po.nUser))
    curso.close()
    conn.commit()
    conn.close()
    pass


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('TabloAnaloy')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
