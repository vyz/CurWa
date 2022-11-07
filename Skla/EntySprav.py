import logging
import logging.config
import pymssql

server = r"VALKOV\LOPO"
dbnameGet = r"OKP"
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
    fo = open("EntySprav710.txt", mode='w', encoding='utf-8-sig')
    formatto = "{i:>2} {texo:<{mnm}} {tablo:<{mtb}} {alo:<{mal}}\n"
    i = 0
    for z in listo:
        i += 1
        fo.write(formatto.format(i=i, texo=z['Sprav'], mnm=mnm,
                 tablo=z['Tablo'], mtb=mtb, alo=z['Aliaso'], mal=mal))
    fo.close()
    logger.debug("mnm: %i mtb: %i mal: %i", mnm, mtb, mal)


def gettablolist():
    global mnm, mtb, mal
    zaprosTablo = """
    select cast(d.Name as nvarchar(100)) as Sprav,
	   e.SOURCE as Tablo,
	   e.IDN as Aliaso
    from OKP_Directories as d inner join
    OKP_sysObjects as e on d.SYSOBJ_ID = e.id
    order by Sprav
    """
    reto = []
    qvero = zaprosTablo
    conn = pymssql.connect(host=server, database=dbnameGet,
                           appname='EntySprav', conn_properties=ConnPropy)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(qvero)
    for row in cursor.fetchall():
        if len(row['Sprav']) > mnm:
            mnm = len(row['Sprav'])
        if len(row['Tablo']) > mtb:
            mtb = len(row['Tablo'])
        if len(row['Aliaso']) > mal:
            mal = len(row['Aliaso'])
        reto.append(row)
    cursor.close()
    conn.close()
    return reto


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Rutto')
    logger.info("Begino EntySprav")
    main()
    logger.info("Endo EntySprav")
