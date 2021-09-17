from bs4 import BeautifulSoup

xmlo = '<?xml version="1.0" encoding="windows-1251"?><ROOT><PARAMETERS><PARAM NAME="FILTER" VALUE="ID=\'790577\'" /></PARAMETERS></ROOT>'
xamo = BeautifulSoup(xmlo, "lxml-xml")
ss = xamo.prettify()
prm = xamo.find("PARAM")
namo = prm['NAME']
filtro = prm['VALUE']
print(namo, filtro)