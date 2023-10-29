from flask import Blueprint, jsonify, request
from controllers import api_controller as con

api = Blueprint('api', __name__)

@api.route('/insert', methods=['POST'])
def insert_nodo():
    nodo = request.get_json() # Obtiene el json enviado por el cliente
    funtion = con.insert_nodo(nodo) # Llama a la funcion del controlador
    data = funtion.fetchone()
    return jsonify(data) # Retorna el resultado de la funcion

@api.route('/api', methods=['GET'])
def get_api():
    return jsonify({'msg': 'Hello, World!'})


