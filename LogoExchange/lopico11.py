from collections import namedtuple
import pickle
from bs4 import BeautifulSoup
from bs4 import NavigableString

Komma = namedtuple("Komma", ["Dato", "Timo", "Logi", "Namo", "Paramo", "Buffo", "Resulto", "Erro"])
Getta = namedtuple("Getta", ["Dato", "Timo", "Logi", "Namo", "Paramo", "Xamlo", "Resulto"])
Setta = namedtuple("Setta", ["Dato", "Timo", "Logi", "Namo", "Paramo", "CmdMode", "TSO", "Doco", "Ida", "DData", "Xamlo", "Resulto", "Paro", "Erro", "BigXamlo"])
with open('lico01.pickle', 'rb') as f:
    Lico = pickle.load(f)

qgs = 0
qgsno = 0
qss = 0
qpr = 0
bgetto = BeautifulSoup("<Getto></Getto>",  "lxml-xml", from_encoding="windows-1251")
getta = bgetto.Getto
Lige = []
bsetto = BeautifulSoup("<Setto></Setto>",  "lxml-xml", from_encoding="windows-1251")
setta = bsetto.Setto
Lise = []

for comma in Lico:
    if comma.Namo == "OKP_GetSkladDoc":
        if len(comma.Buffo) > 20:
            if(comma.Buffo.startswith('<?xml')):
                kk = comma.Buffo.find('<ROOT>')
                xmlo = comma.Buffo[kk:-1]
                xamo = BeautifulSoup(xmlo, "lxml-xml")
                prm = xamo.find("PARAM")
                namo = prm['NAME']
                filtro = prm['VALUE']
                ss = prm.prettify()
                elmo = bgetto.new_tag("Elo")
                aa = bgetto.new_tag("Dato")
                aa.append(NavigableString(comma.Dato)) 
                elmo.append(aa)
                aa = bgetto.new_tag("Timo")
                aa.append(NavigableString(comma.Timo)) 
                elmo.append(aa)
                aa = bgetto.new_tag("Filtro")
                aa.append(NavigableString(filtro)) 
                elmo.append(aa)
                aa = bgetto.new_tag("Paramo")
                aa.append(NavigableString(ss)) 
                elmo.append(aa)
                aa = bgetto.new_tag("Resulto")
                aa.append(NavigableString(comma.Paramo)) 
                elmo.append(aa)
                getta.append(elmo)
                elge = Getta(comma.Dato, comma.Timo, comma.Logi, comma.Namo, ss, elmo.prettify(), comma.Paramo)
                Lige.append(elge)
                qgs += 1
            else:
                qgsno += 1
                print(comma.Buffo)                
    elif comma.Namo == "OKP_SetSkladDoc":
        if len(comma.Buffo) > 20:
            if(comma.Buffo.startswith('<?xml')):
                kk = comma.Buffo.find('<ROOT>')
                xmlo = comma.Buffo[kk:-1]
                xamo = BeautifulSoup(xmlo, "lxml-xml")
                prm = xamo.find("PARAM")
                namo = prm['NAME']
                cmdmoda = prm['VALUE']
                ss = prm.prettify()
                elmo = bsetto.new_tag("Elo")
                aa = bsetto.new_tag("Dato")
                aa.append(NavigableString(comma.Dato)) 
                elmo.append(aa)
                aa = bsetto.new_tag("Timo")
                aa.append(NavigableString(comma.Timo)) 
                elmo.append(aa)
                aa = bsetto.new_tag("CmdMode")
                aa.append(NavigableString(cmdmoda)) 
                elmo.append(aa)
                aa = bsetto.new_tag("Paramo")
                aa.append(NavigableString(ss)) 
                elmo.append(aa)
                aa = bsetto.new_tag("Paro")
                aa.append(NavigableString(comma.Paramo)) 
                elmo.append(aa)
                wk = xamo.ROOT
                exo = wk.HEADER.extract()
                prm = wk.DATA.ROW
                tso = prm.TSO
                elmo.append(tso)
                doco = prm.DOC.string
                aa = bsetto.new_tag("Doco")
                aa.append(doco) 
                elmo.append(aa)
                ida = prm.ID.string
                aa = bsetto.new_tag("Ida")
                aa.append(ida) 
                elmo.append(aa)
                ddata = prm.DKD.string
                aa = bsetto.new_tag("DData")
                aa.append(ddata) 
                elmo.append(aa)
                aa = bsetto.new_tag("Reso")
                aa.append(NavigableString(comma.Resulto)) 
                elmo.append(aa)
                aa = bsetto.new_tag("Erro")
                aa.append(NavigableString(comma.Erro)) 
                elmo.append(aa)
                setta.append(elmo)
                seel = Setta(comma.Dato, comma.Timo, comma.Logi, comma.Namo, \
                    ss, cmdmoda, str(tso.string), str(doco), str(ida), \
                    str(ddata), elmo.prettify(), comma.Resulto, comma.Paramo, comma.Erro, wk.prettify())
                Lise.append(seel)
                qss += 1
    else:
        qpr += 1
fmat = "QGetS {} QSetS {} Proch {}"
print(fmat.format(qgs, qss, qpr))
with open('ligetta03.pickle', 'wb') as f:
    # Pickle the 'data' dictionary using the highest protocol available.
    pickle.dump(Lige, f, pickle.HIGHEST_PROTOCOL)
with open("ligetta03.xml", 'a') as f: f.write(bgetto.prettify())
with open('lisetta03.pickle', 'wb') as f:
    # Pickle the 'data' dictionary using the highest protocol available.
    pickle.dump(Lise, f, pickle.HIGHEST_PROTOCOL)
with open("lisetta03.xml", 'a') as f: f.write(bsetto.prettify())