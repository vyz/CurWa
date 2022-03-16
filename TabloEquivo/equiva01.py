from encodings import utf_8
import logging
import logging.config
import re


def main():
    llogo = readologo()
    lreso = readoreso()
    logger.debug("Tablo logo->%d reso->%d", len(llogo), len(lreso))
    vx = open('equivo.w', 'w', encoding="utf_8")
    for (i, (loga, reso)) in enumerate(zip(sorted(llogo),lreso)):
        if loga != reso:
            logger.error("logo->%d reso->%d", loga, reso)
        vx.write("{i:>3} {lo:<25} {ra:<25}\n".format(i=i, lo=loga, ra=reso))
    vx.close()


def readologo():
    reto = []
    with open('logo.txt', encoding='utf_8') as f:
        for line in f:
            lwo = line.lstrip().lower().split(' ')
            reto.append(lwo[8])
    return reto


def readoreso():
    reto = []
    with open('postgra.txt', encoding='utf_8') as f:
        for line in f:
            pra = re.sub('\s', '', line)
            lwo = pra.split('|')
            if lwo[2] == 'таблица':
                reto.append(lwo[1])
    return reto


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('Equiva')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
