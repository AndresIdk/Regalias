from flask import Flask
from routes import api
from flask_cors import CORS as cors
from mqtt.mqtt_client import create_mqtt_client

from flask_swagger_ui import get_swaggerui_blueprint
SWAGGER_URL="/swagger"
API_URL="/static/swagger.json"

swaggerui_blueprint = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': "API REST"
    }
)

app = Flask(__name__)
app.register_blueprint(swaggerui_blueprint, url_prefix=SWAGGER_URL)

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
    app.run(host='0.0.0.0',debug=False, port=4000)
