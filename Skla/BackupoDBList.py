import logging
import logging.config
import csv


def main():
    fo = open("BackoSet.sql", mode='w', encoding='utf-8-sig')
    with open('Proba.csv', encoding='utf-8-sig') as f:
        rr = csv.reader(f, delimiter=';')
        for row in rr:
            baza = row[0]
            if baza.endswith('_Service'):
                flofrag = baza[:-8] + 'Serv'
            else:
                flofrag = baza
            logger.debug(flofrag)
            reso = backupostroka(baza, flofrag)
            fo.write(reso)
    fo.close()


def backupostroka(dibo: str, frago: str):
    zapros = """
    BACKUP DATABASE {dibo} TO DISK = N'D:\Backupo\Auto2112\{frago}.bak'
    WITH NOFORMAT, NAME = N'{frago}_backauto', SKIP;
    go
    """
    return zapros.format(dibo=dibo, frago=frago)


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Rutto')
    logger.info("Begino")
    try:
        main()
    except:
        logger.exception("Vzval")
    logger.info("Endo")