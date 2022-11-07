import os
import fnmatch
import logging
import logging.config


def main():
    diro = r'e:\Gita\KoPo\710Release\OKP_5\Source'
    # findo = r'SELECT DISTINCT tt.tid, tt.is_import, MAX(noma.rwc) AS noma_err, MAX(cpl.prt$$$nom) AS cpl_err'
    findo = r'Ошибка регистрации предупреждений/ошибок по импортируемым записям:'
    pato = '*.pas'
    logger.debug("Ищем образец  %s", findo)
    findoStroko(diro, findo, pato)


def findoStroko(directory, findo, filePattern):
    for path, dirs, files in os.walk(os.path.abspath(directory)):
        for filename in fnmatch.filter(files, filePattern):
            filepath = os.path.join(path, filename)
            with open(filepath) as f:
                try:
                    s = f.read()
                except UnicodeDecodeError as exco:
                    logger.debug("Бага в %s %s", filepath, exco)
            if findo in s:
                lfo = len(s)
                lisso = s.split('\n')
                lnfo = len(lisso)
                nfo = list()
                for n, ss in enumerate(lisso):
                    if findo in ss:
                        nfo.append(n+1)
                logger.debug("Найдено в %s", filepath)
                logger.debug("Кво %d Строк %d Номера %s", lfo, lnfo, str(nfo))


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('FloUty')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
