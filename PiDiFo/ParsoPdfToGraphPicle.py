from typing import Dict
import fitz
from Classo import Conta as clConta
import re
import logging
import logging.config
import matplotlib.pyplot as plt
import networkx as nx
import pickle


pdf_document = r"E:\KoPo\Helpo\User_7_0_4_220712.pdf"
picleGraphFile = "grapho704.pickle"


def main():
    doc = fitz.open(pdf_document)
    contomaxpage = 5
    vi = 0
    diConto = {}
    kid = 1
    for numo in range(1, doc.page_count):
        if numo < contomaxpage:
            kk, dico = ParsoContoPage(numo, doc.load_page(numo))
            if kk > 0:
                contomaxpage = kk
            for key, valo in dico.items():
                valo.ida = kid
                diConto[key] = valo
                kid += 1
        else:
            vi = numo
            break
    ll = len(diConto)
    logger.debug("Qvo: {} numo: {} pages: {}".format(ll, numo, doc.page_count))
    gro = CreateNW(diConto)
    with open(picleGraphFile, 'wb') as f:
        pickle.dump(gro, f, pickle.HIGHEST_PROTOCOL)
    derevo = nx.algorithms.tree.recognition.is_tree(gro)
    logger.debug(derevo)
    logger.info("PDF-файл -> %s", pdf_document)
    logger.info("Picle-файл -> %s", picleGraphFile)


def ParsoContoPage(numo: int, pago) -> tuple:
    KColontitul = \
        "СПРУТ-ОКП Документация  –  СПРУТ-ОКП Руководство пользователя"
    KContent = "Table of Contents"
    dicto = {}
    reto = -1
    leli = pago.get_links()
    frox = 0.0
    for elo in leli:
        if frox != elo['from'].bl.y:
            frox = elo['from'].bl.y
            xrefa = elo['xref']
            pigo = elo['page']
            toxo = elo['to'].x
            toyo = elo['to'].y
            refa = clConta.Conta(xrefa=xrefa, frox=frox, fropigo=numo+1,
                                 pigo=pigo+1, toxo=toxo, toyo=toyo)
            dicto[xrefa] = refa
    if leli:
        linko = pago.first_link
        urolast = ''
        while linko:
            if linko.is_external:
                uro = linko.uri
                # Нонсенс
                raise RuntimeError("Внешняя ссылка в содержании -> " + uro)
            else:
                uro = linko.uri
                xrefa = linko.xref
                if xrefa in dicto:
                    # Для двухстрочных заголовков надо оставлять один.
                    if uro != urolast:
                        dicto[xrefa].uro = uro
                        urolast = uro
                    else:
                        del dicto[xrefa]
                        logger.debug("Двухстрочный заголовок %s", uro)
            linko = linko.next
    tepa = pago.get_textpage()
    texo = tepa.extractText()
    kk = len(texo)
    if kk > 0:
        ltexo = texo.splitlines()
        kk = len(ltexo)
        assert ltexo[0] == KColontitul
        s1 = ltexo[1]
        pato = r'(\d+)$'
        m1 = re.search(pato, s1)
        searcho = m1.group(0)
        isko = int(searcho)
        assert isko == numo+1
        bego = 2
        cike = 0
        likea = list(dicto.keys())
        if ltexo[2] == KContent:
            fikey = likea[0]
            reto = dicto[fikey].pigo - 2
            bego += 1
        while bego < kk:
            fikey = likea[cike]
            s1 = ltexo[bego]
            '''Некоторые строчки не разбиваются после кода,
            а остаются сцепленными. Приходится их разбивать вручную.'''
            rcodo = re.search(r'^[\d.]+$', s1)
            if rcodo is None:
                rbito = re.split(r' ', s1, 1)
                s1 = rbito[0]
                s2 = rbito[1]
                bego -= 1
            else:
                s2 = ltexo[bego+1]
            dicto[fikey].koda = s1
            # Есть заголовки, которые содержат '.' внутри себя
            # Поэтому у разделителя должно быть не меньше 2 точек подряд.
            rbito = re.split(r'\.{2,}', s2)
            if len(rbito) == 1:
                bego += 1
                s2 += ltexo[bego+1]
                rbito = re.split(r'\.{2,}', s2)
            s1 = rbito[0].strip()
            isko = int(rbito[1])
            assert isko == dicto[fikey].pigo
            dicto[fikey].namo = s1
            bego += 2
            cike += 1
    return(reto, dicto)


def CreateNW(nn: dict) -> nx.DiGraph:
    rooto = clConta.Conta(xrefa=0, frox=0, fropigo=1, pigo=9999,
                          toxo=9999.99, toyo=9999.99, koda='0', namo='Ruto',
                          ida=0)
    G = nx.DiGraph(None, Level=0, Label=' ', Father=-1, Conto=rooto)
    G.add_node(rooto.ida, Label=rooto.namo)
    slv = 0
    skey = rooto.ida
    Fth = {}
    for valo in nn.values():
        (key, lv, lbl) = ContaParsoItem(valo)
        if lv > slv:
            Fth[slv] = skey
            slv = lv
        elif lv == slv:
            pass
        else:
            slv = lv
        skey = key
        G.add_node(key, Level=lv, Label=lbl, Father=Fth[lv-1], Conto=valo)
        G.add_edge(Fth[lv-1], key, Label=valo.koda)
    return G


def ContaParsoItem(itmo: clConta.Conta) -> tuple:
    kk = itmo.ida
    nm = itmo.namo
    if len(nm) > 30:
        nm = nm[:31]
    lvo = itmo.koda.split('.')
    itmo.lvl = len(lvo)
    itmo.lnom = lvo[itmo.lvl-1]
    return(kk, itmo.lvl, nm)


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('PiDiFo')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
