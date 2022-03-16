from typing import Dict
from Classo import Conta as clConta
import logging
import logging.config
import networkx as nx
import pickle


picleGraphPlanovik = "graPlanovik642.pickle"
txtOutFile = "planovik642.txt"
pstarto = 0
BegPageAfter = 299


def main():
    global pstarto
    with open(picleGraphPlanovik, 'rb') as f:
        G = pickle.load(f)
    for v in G:
        Fi = v
        break
    G.nodes.data('Lengo', default=-1)
    pstarto = G.nodes[Fi]['Conto'].pigo
    lp = pstarto
    (spnd, slp) = ReCountoPrinto(G, Fi, lp)
    G.nodes[spnd]['Lengo'] = BegPageAfter - slp
    G.nodes[Fi]['Lengo'] = BegPageAfter - pstarto
    G.nodes[Fi]['Childo'] = G.out_degree(Fi)
    G.nodes[Fi]['Pago'] = 0

    formatto = "{sk:<8} {sn:<64} {ic:>2} {il:>3} {ip:>3}\n"
    fo = open(txtOutFile, mode='w', encoding='utf-8-sig')
    kstr = 0
    for v, gdt in G.nodes(data=True):
        if gdt['Childo'] > 0 or gdt['Level'] == 2:
            fo.write(formatto.format(sk=gdt['Conto'].koda,
                                     sn=obrezo(gdt['Conto'].namo),
                                     ic=gdt['Childo'], il=gdt['Lengo'],
                                     ip=gdt['Pago']))
            kstr += 1
    fo.close()
    logger.debug("Stroko %s", kstr)


def ReCountoPrinto(Grf, nd, lp) -> tuple:
    global pstarto
    llp = lp
    slp = lp
    zp = False
    zk = False
    pnd = nd
    for nn in Grf.successors(nd):
        k = Grf.out_degree(nn)
        leng = Grf.nodes[nn]['Conto'].pigo - llp
        llp = Grf.nodes[nn]['Conto'].pigo
        Grf.nodes[nn]['Childo'] = k
        Grf.nodes[nn]['Pago'] = llp - pstarto
        if zp:
            Grf.nodes[pnd]['Lengo'] = leng
            if zk:
                Grf.nodes[spnd]['Lengo'] = Grf.nodes[nn]['Conto'].pigo - slp
        else:
            zp = True
        if k > 0:
            (spnd, slp) = ReCountoPrinto(Grf, nn, llp)
            zk = True
        else:
            zk = False
        pnd = nn
    return (nn, llp)


def obrezo(stro):
    rz = 64
    if len(stro) > rz:
        k = len(stro) - 20
        ll = 41
        reto = stro[:ll] + '...' + stro[k:]
    else:
        reto = stro
    return reto


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('PiDiFo')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
