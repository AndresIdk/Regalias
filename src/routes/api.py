from flask import Blueprint, jsonify, request
from controllers import api_controller as con

api = Blueprint('api', __name__)

@api.route('/get', methods=['GET'])
def get_api():
    try:
        data = con.get_all()
        return jsonify(data)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@api.route('/insert', methods=['POST'])
def insert_nodo():
    try:
        nodo = request.get_json()  # Obtiene el json enviado por el cliente
        funtion = con.insert_nodo(nodo)  # Llama a la funcion del controlador
        data = funtion.fetchone()
        return jsonify(data)  # Retorna el resultado de la funcion
    except Exception as e:
        return jsonify({"error": str(e)}), 500





