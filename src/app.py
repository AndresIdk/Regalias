from flask import Flask
from routes import api
from flask_cors import CORS as cors
from mqtt.mqtt_client import create_mqtt_client

app = Flask(__name__)
cors(app) # Habilita CORS para todas las rutas

# Manejo de errores para pagina inexistentes
@app.errorhandler(404)
def page_not_found(error):
    return "<h1>Pagina no encontradaaa</h1>", 404

# Definicion de rutas
api = app.register_blueprint(api.api, url_prefix='/api') # Comunicacion con el frontend

# Inicializacion del cliente MQTT
client = create_mqtt_client() # Comunicacion con el broker
client.loop_start() # Inicia el loop del cliente MQTT

if __name__ == '__main__':
    app.run(debug=False, port=5000)