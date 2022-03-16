from encodings import utf_8
import logging
import logging.config
import re

flo = 'E:\\Wabo\\Postgra\\BazoKrit\\'
flw = 'E:\\Wabo\\Postgra\\TabloKrit\\'
fino = 'Ino\\'
foto = 'Oto\\'


def main():
    minno = ''
    mitto = ''
    stroka = ''
    taboname = ''
    numa = 0
    mima = 0
    with open(flo+'CREATE3_Tables.sql', encoding='utf_8') as f:
        for line in f:
            vix = ''
            if line.lstrip().lower().startswith('create table'):
                if numa > 0:
                    vx = open(flmi + '{:03}.q'.format(mima), 'w',
                              encoding="utf_8")
                    vx.write(minno)
                    vx.close()
                    minno = ''
                    vx = open(flmo + '{:03}.w'.format(mima), 'w',
                              encoding="utf_8")
                    vx.write(mitto)
                    vx.close()
                    mitto = ''
                else:
                    flmi = flw + fino + '0\\i'
                    flmo = flw + foto + '0\\o'
                numa += 1
                mima += 1
                if mima > 100:
                    cato = str(int(numa / 100))
                    mima = mima - 100
                    flmi = flw + fino + cato + '\\i'
                    flmo = flw + foto + cato + '\\o'
                taboname = seltaboname(line).rstrip()
                if taboname.lower().startswith('dbo.'):
                    vix = Deldbo(line)
                    taboname = seltaboname(vix)
                else:
                    vix = line
                logger.debug("Tablo %s %d", taboname, numa)
            elif line.lstrip().lower().startswith(
                      'exec sp_addextendedproperty'):
                vix = Descripto(line)
                if vix == "ERR":
                    logger.error("ERR-DESCR-> %d %s", numa, taboname)
            elif 'identity' in line.lower():
                vix = oIdentity(line)
            elif ' float' in line.lower():
                vix = ReplFloat(line)
            elif ' datetime' in line.lower():
                vix = ReplDateTime(line)
            elif ' tinyint' in line.lower():
                vix = ReplTinyint(line)
            elif ' bit ' in line.lower():
                vix = ReplBit(line)
            elif ' uniqueidentifier' in line.lower():
                vix = ReplUuid(line)
            elif ' image' in line.lower():
                vix = ReplImage(line)
            elif ' varbinary' in line.lower():
                vix = ReplVarBinary(line)
            elif ' varchar(max)' in line.lower():
                vix = ReplVarcharmax(line)
            elif ' sysname' in line.lower():
                vix = ReplSysname(line)
            elif ' clustered' in line.lower():
                vix = DelClustered(line)
            elif ' collate database_default' in line.lower():
                vix = DelCollate(line)
            elif 'go' == line.lower().strip():
                vix = ';\n'
            else:
                vix = line
            stroka += vix
            minno += line
            mitto += vix
    vx = open(flo+'bigo.w', 'w', encoding="utf_8")
    vx.write(stroka)


def seltaboname(sinno: str) -> str:
    lwo = sinno.lstrip().split(' ')
    return lwo[2]


def Descripto(sinno: str) -> str:
    # Не все наши друзья ставят N
    pat = "'MS_Description'"
    reto = re.sub(pat, '', sinno, count=1, flags=re.I)
    pat = r"N?'(.*?)'"
    mmi = re.findall(pat, reto)
    if len(mmi) == 5:
        reto = "COMMENT ON TABLE " + mmi[4] + " IS '" + mmi[0] + "';\n"
    elif len(mmi) == 7:
        reto = "COMMENT ON COLUMN " + mmi[4] + \
            "." + mmi[6] + " IS '" + mmi[0] + "';\n"
    else:
        reto = "ERR"
    return reto


def ReplFloat(sinno: str) -> str:
    if sinno.lstrip().lower().startswith('float'):
        sinno = sinno.lstrip()
    pat1 = r' float\(53\)'
    pat2 = r' float'
    repl = r' double precision'
    reto = re.sub(pat1, repl, sinno, count=1, flags=re.I)
    reto = re.sub(pat2, repl, reto, count=1, flags=re.I)
    return reto


def ReplDateTime(sinno: str) -> str:
    if sinno.lstrip().lower().startswith('datetime'):
        sinno = sinno.lstrip()
    pat = r' datetime'
    repl = r' timestamp with time zone'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    if 'getdate()' in reto.lower():
        pat = r'getdate\(\)'
        repl = r'CURRENT_TIMESTAMP'
        reto = re.sub(pat, repl, reto, count=1, flags=re.I)
    return reto


def ReplTinyint(sinno: str) -> str:
    pat = r'tinyint'
    repl = r'smallint'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def ReplVarcharmax(sinno: str) -> str:
    pat = r' varchar\(max\)'
    repl = r' text'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    if ' collate database_default' in reto.lower():
        reto = DelCollate(reto)
    return reto


def ReplBit(sinno: str) -> str:
    pat = r' bit'
    repl = r' boolean'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    if 'default 0' in reto.lower():
        pat = r'DEFAULT 0'
        repl = r"DEFAULT 'false'"
        reto = re.sub(pat, repl, reto, count=1, flags=re.I)
    elif 'default 1' in reto.lower():
        pat = r'DEFAULT 1'
        repl = r"DEFAULT 'true'"
        reto = re.sub(pat, repl, reto, count=1, flags=re.I)
    return reto


def ReplUuid(sinno: str) -> str:
    pat = r' uniqueidentifier'
    repl = r' uuid'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    if 'newid()' in reto.lower():
        pat = r'newid\(\)'
        repl = r'gen_random_uuid()'
        reto = re.sub(pat, repl, reto, count=1, flags=re.I)
    return reto


def ReplSysname(sinno: str) -> str:
    pat = r' sysname'
    repl = r' varchar(128) NOT NULL'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def ReplImage(sinno: str) -> str:
    pat = r' image'
    repl = r' bytea'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def ReplVarBinary(sinno: str) -> str:
    pat = r' varbinary\(\d+\)'
    repl = r' bytea'
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def DelClustered(sinno: str) -> str:
    pat = r' CLUSTERED'
    repl = r''
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def DelCollate(sinno: str) -> str:
    pat = r' collate database_default'
    repl = r''
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def Deldbo(sinno: str) -> str:
    pat = r'dbo.'
    repl = r''
    reto = re.sub(pat, repl, sinno, count=1, flags=re.I)
    return reto


def oIdentity(sinno: str) -> str:
    reto = "ERRO"
    lwo = sinno.lstrip().lower().split(' ')
    if 'bigint' in lwo:
        reto = lwo[0] + ' bigserial,\n'
    elif 'int' in lwo:
        reto = lwo[0] + ' serial,\n'
    return reto


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Progra')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
