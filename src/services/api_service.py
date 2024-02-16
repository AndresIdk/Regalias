from models.nodo import Nodo as nd
from datetime import datetime

date = datetime.today()

def create_nodo(nodo):
    node = nd(**nodo)

    nodoT = (
        '2021-10-10',
        str(node.temp),
        str(node.ph),
        str(node.ec),
        str(node.od),
        str(node.tds),
        str(node.coordenadas["latitud"]),
        str(node.coordenadas["altitud"]),
        node.id_node,
    )
    return nodoT

def show_data(data):
    dat = []
    for i in range(len(data)):
        dato = data[i][0] # Se toma el dato
        datoP = dato.strip("()") # Se quitan los parentesis
        datoC = datoP.split(",") # Se separa por comas
        dat.append({
            "id": datoC[0],
            "fecha": datetime.strptime(datoC[1], '%Y-%m-%d'),
            "temp": datoC[2],
            "ph": datoC[3],
            "ec": datoC[4],
            "od": datoC[5],
            "tds": datoC[6],
            "latitud": datoC[7],
            "altitud": datoC[8]
        })
    return dat