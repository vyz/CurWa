from collections import namedtuple
import re
import pickle

Komma = namedtuple("Komma", ["Dato", "Timo", "Logi", "Namo", "Paramo", "Buffo", "Resulto", "Erro"])
Lico = []
qva = 0
patodato = re.compile(r'^\d\d\.\d\d\.\d\d\d\d')
patotimo = re.compile(r'^\d\d:\d\d:\d\d\.\d\d\d')
patocommo = re.compile(r'^\[(.*?)\] Команда <(.*?)>')
fisto = False
lastcomo = None
flPar = False
flZav = False
flErr = False
with open("OKPExchange.log") as f:
    for line in f:
        datoz = line[:10]
        reso = patodato.match(datoz)
        if reso:
            if fisto:
                if lastcomo:
                    if flErr:
                        if flZav:
                            paramo += buffo
                            buffo = ''
                            flZav = False
                            ers = ""
                        else:
                            ers = "Error"
                        drComma = Komma(lastcomo.Dato, lastcomo.Timo, lastcomo.Logi, \
                            lastcomo.Namo, paramo, lastcomo.Buffo, ers, buffo)
                        Lico.append(drComma)
                        lastcomo = None
                        flPar = False
                        flErr = False
                        paramo = ""
                        buffo = ""
                    elif lastcomo.Logi == logi and lastcomo.Namo == namo:
                        #продолжение
                        paramo += buffo
                        flPar = True
                    else:
                        if flPar:
                            drComma = Komma(lastcomo.Dato, lastcomo.Timo, lastcomo.Logi, \
                                lastcomo.Namo, paramo, lastcomo.Buffo , "", "")
                            Lico.append(drComma)
                            flPar = False
                            paramo = ""
                        else:
                            Lico.append(lastcomo)
                        lastcomo = Komma(dato, timo, logi, namo, paramo, buffo, "", "" )
                else:
                    lastcomo = Komma(dato, timo, logi, namo, paramo, buffo, "", "")
            else:
                fisto = True
                buffo = ''
                paramo = ''
            dato = datoz
            timo = line[11:23]
            resotime = patotimo.match(timo)
            if resotime:                
                kusok = line[26:]
                if kusok.startswith("Команда"):
                    buffo = kusok[8:].strip()
                    logi = ""
                    namo = ""
                else:
                    kk = kusok.find("Команда")
                    resocomo = patocommo.match(kusok)
                    if resocomo:
                        logi = resocomo.group(1)
                        namo = resocomo.group(2)
                        if namo == "OKP_SetSkladDoc":
                            flZav = True
                        else:
                            flZav = False
                        kk = resocomo.end(2)+2
                        kusok = kusok[kk:]
                        if kusok.startswith("Параметры"):
                            kk = kusok.find("Buf")
                            if kk:
                                buffo = kusok[kk+5:].strip()
                                qva += 1
                        else:
                            buffo = kusok.strip()
                            if flZav:
                                erzk = kusok.find("Завершено с ошибкой")
                                if erzk >= 0:
                                    flErr = True
                                    flZav = False
                                elif buffo == "Завершено":
                                    flErr = True
        else:
            buffo += line.strip()
fmat = "Qva {} Razmer Lico {}"
print(fmat.format(qva, len(Lico)))
with open('lico01.pickle', 'wb') as f:
    # Pickle the 'data' dictionary using the highest protocol available.
    pickle.dump(Lico, f, pickle.HIGHEST_PROTOCOL)