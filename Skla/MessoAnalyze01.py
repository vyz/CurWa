import logging
import logging.config
import pymssql
import re

server = r"VALKOV\LOPO"
dbnameOut = r"BiLoAnalo"
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


def main():
    ns = 0
    shag = 50000
    fino = 549999
    eido = ns + shag
    while ns < fino:
        logger.debug("Start %s Endo %s", ns, eido)
        listo = getstrokolist(ns, eido)
        dicto = getmessodict()
        (g1, g2, g3, g4, g5, g6) = RazborAndZapis(listo, dicto)
        logger.debug("Gruppy 1-> %s 2-> %s 3-> %s 4-> %s 5-> %s 6-> %s",
                     g1, g2, g3, g4, g5, g6)
        ns = eido
        eido += shag


def getstrokolist(starto: int, endo: int):
    zaprosTablo = """
    select Id, cast(namo as nvarchar(1500)) as Stroka
    from Messo
    where Id > {starto} and Id <= {endo}
    """
    reto = []
    qvero = zaprosTablo.format(starto=starto, endo=endo)
    conn = pymssql.connect(host=server, database=dbnameGet,
                           appname='MessoAnalyze', conn_properties=ConnPropy)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(qvero)
    for row in cursor.fetchall():
        ido = row['Id']
        stroka = row['Stroka']
        reto.append((ido, stroka))
    cursor.close()
    conn.close()
    return reto


def getmessodict():
    zaprosTablo = """
    SELECT Gruppa, Word1, Word2, Patter
    FROM MessoGruppo
    order by Gruppa, Orda desc
    """
    gdic = {1: {}, 2: {}, 3: {}}
    conn = pymssql.connect(host=server, database=dbnameOut,
                           appname='Zapiso', conn_properties=ConnPropy)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(zaprosTablo)
    for row in cursor.fetchall():
        gruppa = row['Gruppa']
        w1 = row['Word1']
        w2 = row['Word2']
        patto = row['Patter']
        gdic[gruppa][patto] = (w1, w2)
    cursor.close()
    conn.close()
    return gdic


def RazborAndZapis(listo, gdic):
    g1, g2, g3, g4, g5, g6 = 0, 0, 0, 0, 0, 0

    conn = pymssql.connect(host=server, database=dbnameOut,
                           appname='Zapiso', conn_properties=ConnPropy)
    cursor = conn.cursor()
    for z, ss in listo:
        (ig, w1, w2, hv) = razborka(ss, gdic)
        if ig == 1:
            g1 += 1
        elif ig == 2:
            g2 += 1
        elif ig == 3:
            g3 += 1
        elif ig == 4:
            g4 += 1
        elif ig == 5:
            g5 += 1
        elif ig == 6:
            g6 += 1
        else:
            logger.debug("Без группы %s", ss)
            continue
        cursor.callproc('AddLineMessoGruppo', (z, ig, w1, w2, hv,))
    cursor.close()
    conn.commit()
    conn.close()
    return (g1, g2, g3, g4, g5, g6)


def razborka(ss: str, gd):
    pat1 = r'\{[\dA-F]{8}-[\dA-F]{4}-[\dA-F]{4}-[\dA-F]{4}-[\dA-F]{12}\}:'
    pat2 = r'Формирование отчета '
    patw = r''
    igo = 0
    w1 = ' '
    w2 = ' '
    hvost = ' '

    mame = re.match(pat1, ss)
    if mame:
        igo = 1
        hvost = ss[mame.end():]
        (riga, w1, w2) = razdicto(gd[igo], hvost)
        igo += riga
        return(igo, w1, w2, hvost)
    mame = re.match(pat2, ss)
    if mame:
        igo = 2
        hvost = ss[mame.end():]
        (riga, w1, w2) = razdicto(gd[igo], hvost)
        igo += riga
        return(igo, w1, w2, hvost)
    if igo == 0:
        igo = 3
        hvost = ss
        (riga, w1, w2) = razdicto(gd[igo], hvost)
        igo += riga
    return(igo, w1, w2, hvost)


def razdicto(pdi, hvost):
    for kpat in pdi:
        magro = re.match(kpat, hvost)
        if magro:
            (dw1, dw2) = pdi[kpat]
            return(0, dw1, dw2)
    dw1 = ' '
    dw2 = ' '
    lisa = re.split(r'\W+', hvost)
    if len(lisa) > 1:
        if len(lisa[1]) > 0:
            dw2 = lisa[1]
    if len(lisa) > 0:
        if len(lisa[0]) > 0:
            dw1 = lisa[0]
    return(3, dw1, dw2)


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Rutto')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Skla")
    logger.info("Endo %s", __file__)
