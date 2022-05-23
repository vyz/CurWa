from encodings import utf_8
import logging
import logging.config
import re
import regex

flo = 'CREATE_Tables702.sql'
fota = 'E:\\Wabo\\pyato\\CurWa\\TabloAnaloy\\otta\\'


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
                    (fildy, constra) = FieldoParso(topo)
                    logger.debug("TabloSet %s", topo)
                numa += 1
                minno = ''
            minno += line


def VanTablo(conto: str) -> tuple:
    pat = r'''
(?<rec> #capturing group rec
    \( #open parenthesis
    (?: #non-capturing group
        [^()]+ #anyting but parenthesis one or more times without backtracking
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
# Первые предпосылки:
# Каждое поле определяется в одной строке.
    fli = []
    ogli = []
    nabo = sinno.split('\n')
    for elo in nabo:
        tt = elo.strip()
        if tt.startswith('(') or tt.startswith(')') or len(tt) == 0:
            continue
        if tt.endswith(','):
            tt = tt[:-1]
        clo = SkobkoDav(tt)
        lwo = clo.split(' ')
        qwo = len(lwo)
        if lwo[0].lower() == 'constraint':
            ogli = ConstraintParso(clo, lwo, qwo)
        else: 
            fildo = lwo[0]
            (mso, dln, fUser, uNamo) = TypoDefo(lwo[1])
            fana = False
            for (nn, ewa) in enumerate(lwo[2:]):
                if fana:
                    continue
                if ewa.lower() == 'not':
                    if lwo[nn+3].lower() == 'null':
                        fNullo = False
                    zOgr = lwo[nn+3]
                    fana = True
                if ewa.lower() == 'constraint':
                    fOgr = True
                    zOgr = lwo[nn+3]
                    fana = True

    return(fli, ogli)


def SkobkoDav(sinno: str) -> str:
    return sinno


def TypoDefo(sinno: str) -> tuple:
    return (0,1,2,3)


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
