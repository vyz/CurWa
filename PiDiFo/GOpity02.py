from typing import Dict
from Classo import Conta as clConta
import logging
import logging.config
import matplotlib.pyplot as plt
import networkx as nx
import pickle


def main():
    with open('graPlanovik.pickle', 'rb') as f:
        G = pickle.load(f)
    nodesize = [G.out_degree(v) * 30 for v in G]
    edgelabels = {(u, v): G.edges[u, v]['Label'] for u, v in G.edges()}
    pos = nx.kamada_kawai_layout(G)
    fig, ax = plt.subplots(figsize=(17, 8))
    nx.draw_networkx_edges(G, pos, alpha=0.3, edge_color="m")
    nx.draw_networkx_edge_labels(G, pos, edgelabels)
    nx.draw_networkx_nodes(G, pos, node_size=nodesize, node_color="#210070",
                           alpha=0.9)
    label_options = {"ec": "k", "fc": "white", "alpha": 0.7}
    nx.draw_networkx_labels(G, pos, font_size=8, bbox=label_options)
    # Title/legend
    font = {"fontname": "Helvetica", "color": "k", "fontweight": "bold",
            "fontsize": 14}
    ax.set_title("8. Модуль Плановик", font)
    # Change font color for legend
    font["color"] = "r"
    # Resize figure for label readibility
    ax.margins(0.1, 0.05)
    fig.tight_layout()
    plt.axis("off")
    plt.show()


if __name__ == '__main__':
    logging.config.fileConfig('logging.conf')
    logger = logging.getLogger('PiDiFo')
    logger.info("Begino %s", __file__)
    try:
        main()
    except BaseException:
        logger.exception("Vzval")
    logger.info("Endo %s", __file__)
