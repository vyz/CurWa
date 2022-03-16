import logging
import logging.config
import pymssql

server = r"VALKOV\LOPO"
dbnameGet = r"O642"
ConnPropy = """
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET ANSI_NULLS ON;
SET ANSI_NULL_DFLT_ON ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET IMPLICIT_TRANSACTIONS OFF;
SET CURSOR_CLOSE_ON_COMMIT OFF;
SET QUOTED_IDENTIFIER ON;
SET TEXTSIZE 2147483647;
"""
mnm = 0
mtb = 0
mal = 0


def main():
    listo = gettablolist()
    fo = open("EntyObj642.txt", mode='w', encoding='utf-8-sig')
    formatto = "{i:>2} {texo:<{mnm}} {tablo:<{mtb}} {alo:<{mal}} {zg} {zd}\n"
    i = 0
    for z in listo:
        i += 1
        zg = 'W' if z['g']==1 else ' '
        zd = 'W' if z['d']==1 else ' '
        fo.write(formatto.format(i=i, texo=z['Texo'], mnm=mnm,\
            tablo=z['Tablo'], mtb=mtb, alo=z['Alyaso'], mal=mal,\
            zg=zg, zd=zd))            
    fo.close()
    logger.debug("mnm: %i mtb: %i mal: %i", mnm, mtb, mal)


def gettablolist():
    global mnm, mtb, mal
    zaprosTablo = """
    SELECT cast(DESCRIBE as nvarchar(100)) as Texo, SOURCE as Tablo, IDN as Alyaso, has_perm_group as g, has_perm_dep as d
    FROM OKP_sysObjects
    where has_perm_base = 1
    order by DESCRIBE
    """
    reto = []
    qvero = zaprosTablo
    conn = pymssql.connect(host=server, database=dbnameGet,\
           appname='EntyObj', conn_properties=ConnPropy)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(qvero)
    for row in cursor.fetchall():
        if len(row['Texo']) > mnm:
            mnm = len(row['Texo'])
        if len(row['Tablo']) > mtb:
            mtb = len(row['Tablo'])
        if len(row['Alyaso']) > mal:
            mal = len(row['Alyaso'])
        reto.append(row)
    cursor.close()
    conn.close()
    return reto


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Rutto')
    logger.info("Begino")
    main()
    logger.info("Endo")    