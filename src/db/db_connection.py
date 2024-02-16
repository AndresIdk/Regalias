import psycopg2
from psycopg2 import DatabaseError
import os
from dotenv import load_dotenv
import time

load_dotenv()


class DBConnection:
    def __init__(self):
        self.connection = None
        self.cursor = None
        self.db_ready = False

        while not self.db_ready:
            try:
                # Intenta conectarte a la base de datos
                self.connection = psycopg2.connect(
                    host=os.getenv("DB_HOST"),
                    database=os.getenv("DB_NAME"),
                    user=os.getenv("DB_USER"),
                    password=os.getenv("DB_PASSWORD"),
                    port="5432",  # Puerto predeterminado de PostgreSQL
                )
                self.cursor = self.connection.cursor()
                # Si la conexión tiene éxito, establece db_ready a True para salir del bucle
                self.db_ready = True
                print("¡La base de datos está lista!")
            except psycopg2.OperationalError as e:
                print("Esperando a que la base de datos esté disponible...")
                time.sleep(1)

    def execute_query(self, query, params=None):
        decoded_query = self.cursor.mogrify(query, params).decode('utf-8')
        print("Ejecutando la consulta:", decoded_query)
        self.cursor.execute(query, params or None)
        self.connection.commit()
        return self.cursor

    def close_connection(self):
        self.cursor.close()
        self.connection.close()

    def query_error_handler(self):
        self.connection.rollback()
