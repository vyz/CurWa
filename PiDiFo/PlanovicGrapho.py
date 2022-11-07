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
    pos = nx.multipartite_layout(G, subset_key='Level', align='vertical',
                                 scale=1)
    fig, ax = plt.subplots(figsize=(17, 8))
    posnode = pos.copy()
    y2 = 0
    y31 = 0
    y32 = 0
    sk31 = 0
    sk32 = 0
    fal = 0
    y4 = 0
    for k, n in posnode.items():
        lvol = G.nodes[k]['Level']
        ito = G.nodes[k]['Conto']
        if lvol == 1:
            G.nodes[k]['Label'] = ''
            posnode[k][0] = -0.035
        else:
            G.nodes[k]['Label'] = ito.namo[:30]
            if lvol == 2:
                posnode[k][0] = -0.025
                posnode[k][1] = y2 * 0.25 - 1.5
                y2 += 1
            elif lvol == 3:
                if y31 == 0:
                    sk31 = G.nodes[k]['Father']
                    posnode[k][0] = -0.01
                    posnode[k][1] = y31 * 0.15 - 2.0
                    y31 += 1
                    fal = 1
                elif fal == 1:
                    if sk31 == G.nodes[k]['Father']:
                        posnode[k][0] = -0.01
                        posnode[k][1] = y31 * 0.15 - 2.0
                        y31 += 1
                    else:
                        fal = 2
                        sk32 = G.nodes[k]['Father']
                        posnode[k][0] = 0.005
                        posnode[k][1] = y32 * 0.15 - 2.0
                        y32 += 1
                        y31 += 1
                elif fal == 2:
                    if sk32 == G.nodes[k]['Father']:
                        posnode[k][0] = 0.005
                        posnode[k][1] = y32 * 0.15 - 2.0
                        y32 += 1
                    else:
                        fal = 1
                        sk31 = G.nodes[k]['Father']
                        posnode[k][0] = -0.01
                        posnode[k][1] = y31 * 0.15 - 2.0
                        y31 += 1
                        y32 += 1
            else:
                posnode[k][0] = 0.025
                posnode[k][1] = y4 * 0.25 - 1.5
                y4 += 1
        logger.debug("Level - %s", repr(lvol))
        logger.debug("k - %s", repr(k))
        logger.debug("n - %s", repr(n))
    nx.draw_networkx_edges(G, posnode, alpha=0.3, edge_color="m")
    nx.draw_networkx_edge_labels(G, posnode, edgelabels)
    nx.draw_networkx_nodes(G, posnode, node_size=nodesize,
                           node_color="#210070",
                           alpha=0.9)
    label_options = {"ec": "k", "fc": "white", "alpha": 0.7}
    nodelabels = {n: G.nodes[n]['Label'] for n in G}
    nx.draw_networkx_labels(G, posnode, nodelabels, font_size=8,
                            bbox=label_options,
                            horizontalalignment='left')
    # Title/legend
    font = {"fontname": "Helvetica", "color": "k", "fontweight": "bold",
            "fontsize": 14}
    ax.set_title("6. Модуль Плановик", font)
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
