from flask import Flask
from routes import api

app = Flask(__name__)

# Manejo de errores para pagina inexistentes
@app.errorhandler(404)
def page_not_found(error):
    return "<h1>Pagina no encontradaaa</h1>", 404

# Definicion de rutas
app.register_blueprint(api.api, url_prefix='/api') # Comunicacion con el frontend


if __name__ == '__main__':
    app.run(debug=True, port=5000)