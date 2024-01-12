import psycopg2
import time
import sys

def check_db_connection():
    db_ready = False
    while not db_ready:
        try:
            # Intenta conectarte a la base de datos
            conn = psycopg2.connect(
                dbname='nombre_basedatos',
                user='usuario',
                password='contraseña',
                host='nombre_servicio_db',  # Este sería el nombre del servicio en tu archivo docker-compose.yml
                port='5432'  # Puerto predeterminado de PostgreSQL
            )
            # Si la conexión tiene éxito, establece db_ready a True para salir del bucle
            db_ready = True
            conn.close()
            print("¡La base de datos está lista!")
        except psycopg2.OperationalError as e:
            print("Esperando a que la base de datos esté disponible...")
            time.sleep(1)

if _name_ == "_main_":
    check_db_connection()
    # Una vez que la base de datos esté lista, puedes iniciar tu aplicación
    print("Iniciando la aplicación...")
    # Coloca aquí el código para iniciar tu aplicación (reemplaza este comentario)
    # Ejemplo:
    # from tu_app import app
    # app.run(host='0.0.0.0', port=5000)