from entities.nodo import Nodo as nd
from datetime import datetime

date = datetime.today()

def create_nodo(nodo):
    node = nd(**nodo)

    nodoT = (
        date.date(),
        str(node.temp),
        str(node.ph),
        str(node.ec),
        str(node.od),
        str(node.tds)
    )
    return nodoT