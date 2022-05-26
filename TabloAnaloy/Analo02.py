from encodings import utf_8
import logging
import logging.config
import re
import regex

flo = 'CREATE_Tables702.sql'
fota = 'E:\\Wabo\\pyato\\CurWa\\TabloAnaloy\\otta\\'
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
    numa = 0
    with open(flo, encoding='cp1251') as f:
        for line in f:
            vix = ''
            if line.lstrip().lower().startswith('create table'):
                if numa > 0:
                    (taboname, topo, downo) = VanTablo(minno)
                    logger.debug("Tablo %s %d", taboname, numa)
                    vx = open(fota + taboname + '.w', 'w',
                              encoding="utf_8")
                    vx.write(minno)
                    vx.close()
                    logger.debug("TabloSet %s", topo)
                    (fildy, constra) = FieldoParso(topo)
                numa += 1
                minno = ''
            minno += line
    logger.info("!!!Новые типы: %s", repr(LNewTypes))


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
    ogli = []
    nabo = sinno.split('\n')
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
            qwo = len(lwo)
            if lwo[0].lower() == 'constraint' or \
               lwo[0].lower() == 'primary' and lwo[1].lower() == 'key':
                ogli = ConstraintParso(flo, lwo, qwo)
            else:
                fildo = lwo[0]
                (mso, dln, fUser, uNamo) = TypoDefo(lwo[1])
                fana = False
                fIdnty = False
                fNullo = True  # Умолчание в MS SQL
                fOgr = False
                fColla = False
                zOgr = ''
                nOgr = ''
                kfa = 0
                for (nn, ewa) in enumerate(lwo[2:]):
                    if fana and kfa > 0:
                        kfa -= 1
                        continue
                    if ewa.lower() == 'not':
                        if lwo[nn+3].lower() == 'null':
                            fNullo = False
                        fana = True
                        kfa = 1
                    elif ewa.lower() == 'null':
                        fNullo = True
                    elif ewa.lower() == 'constraint':
                        fOgr = True
                        nOgr = lwo[nn+3]
                        assert(lwo[nn+4].lower().startswith('default'))
                        fana = True
                        kfa = 1
                    elif ewa.lower().startswith('default'):
                        fOgr = True
                        if ewa.endswith(')'):
                            dd = ewa.split('(', 1)
                            zOgr = dd[1][:-1].lower()
                        else:
                            zOgr = lwo[nn+3]
                            kfa = 1
                            fana = True
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
                        fana = True
                        kfa = 1
                    elif (ewa.lower() == 'identity(1,1)' or
                          ewa.lower() == 'identity' or
                          ewa.lower() == 'identity(1,10)'):
                        # 10 таблица OKP_NNUM
                        fIdnty = True
                    else:
                        logger.error("Нежданчик -> %s", ewa)
                logger.debug(
                 "Fildo: %s -> %s %s %s %s F-> %s N-> %s O-> %s %s %s C-> %s",
                 fildo, mso, dln, fUser, uNamo, fIdnty, fNullo,
                 fOgr, nOgr, zOgr, fColla)
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


def ConstraintParso(sinno: str, lwo: list, qwo: int) -> list:
    return lwo


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('TabloAnaloy')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
