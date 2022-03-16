import logging
import logging.config
import pymssql

server = r"VALKOV\SQLEXPRESS"
dbnameGet = r"BigoLogo"
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
mnm = 0
mfn = 0


def main():
    listo = gettablolist()
    fo = open("serveroBF01.txt", mode='w', encoding='utf-8-sig')
    formatto = "{i:>3} {db:<{mnm}} {sz:>5} {flo:<40} {dt:%Y-%m-%d}\n"
    i = 0
    k = True
    for z in listo:
        if k:
            sdibo = z['DBName'] 
            i += 1
            k = False
        else:
            sdibo = ''
            k = True
        fo.write(formatto.format(i=i, db=sdibo, mnm=mnm, sz=z['Sizo'], flo=obrezo(z['FileName']), dt=z['dato']))            
    fo.close()
    logger.debug("mnm : {} mfn : {}".format( mnm, mfn))


def gettablolist():
    global mnm, mfn
    zaprosTablo = """
SELECT  d.name AS DBName, convert(int, convert(float, m.size)/128.0) as Sizo,
        m.physical_name AS FileName,
		create_date as dato
FROM    sys.databases d
        JOIN sys.master_files m ON d.database_id = m.database_id
WHERE   m.[type] in(0,1) and not d.name in ('tempdb', 'master', 'model', 'msdb')
ORDER BY d.name 
    """
    reto = []
    qvero = zaprosTablo
    conn = pymssql.connect(host=server, database=dbnameGet,\
           appname='ServeroBF', conn_properties=ConnPropy)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(qvero)
    for row in cursor.fetchall():
        if len(row['DBName']) > mnm:
            mnm = len(row['DBName'])
        if len(row['FileName']) > mfn:
            mfn = len(row['FileName'])
        reto.append(row)
    cursor.close()
    conn.close()
    return reto


def obrezo(stro):
    rz = 40
    if len(stro) > rz:
        k = stro.rfind('\\')
        ll = rz - (len(stro) - k) - 3
        reto = stro[:ll] + '...' + stro[k:]
    else:
        reto = stro
    return reto


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Rutto')
    logger.info("Begino")
    main()
    logger.info("Endo")
    