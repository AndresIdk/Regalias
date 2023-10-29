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

def show_data(data):
    dat = []
    for i in range(len(data)):
        dato = data[i][0] # Se toma el dato
        datoP = dato.strip("()") # Se quitan los parentesis
        datoC = datoP.split(",") # Se separa por comas
        print("datoC:",datoC)

        dat.append({
            "id": datoC[0],
            "fecha": datetime.strptime(datoC[1], '%Y-%m-%d'),
            "temp": datoC[2],
            "ph": datoC[3],
            "ec": datoC[4],
            "od": datoC[5],
            "tds": datoC[6]
        })
    return dat