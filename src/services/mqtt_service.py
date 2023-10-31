from flask import jsonify
from controllers import api_controller as con
import json

def insert_nodo(nodo):
    nodo = json.loads(nodo)
    funtion = con.insert_nodo(nodo) # Llama a la funcion del controlador
    data = funtion.fetchone()
    return data # Retorna el resultado de la funcion