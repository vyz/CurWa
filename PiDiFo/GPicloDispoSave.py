from typing import Dict
from Classo import Conta as clConta
import logging
import logging.config
import networkx as nx
import pickle


picleGraphAll = "grapho704.pickle"
picleGraphPlanovik = "graDispo704.pickle"


def main():
    with open(picleGraphAll, 'rb') as f:
        BiG = pickle.load(f)
    # 71 - это ID узла Модуль Плановик
    # 170 - это ID узла Модуль Диспетчер
    K = nx.bfs_tree(BiG, source=170)
    derevo = nx.algorithms.tree.recognition.is_tree(K)
    logger.debug(derevo)
    G = BiG.subgraph(K.nodes()).copy()
    with open(picleGraphPlanovik, 'wb') as f:
        pickle.dump(G, f, pickle.HIGHEST_PROTOCOL)
    logger.info("Picle-файл ALL -> %s", picleGraphAll)
    logger.info("Picle-файл Module -> %s", picleGraphPlanovik)


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('PiDiFo')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
