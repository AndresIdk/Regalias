import psycopg2
from psycopg2 import DatabaseError
import os
from dotenv import load_dotenv
import asyncio
import time

load_dotenv()

class DBConnection:
    db_ready = False
    while not db_ready:
        try:
            # Intenta conectarte a la base de datos
            conn = psycopg2.connect(
                    host=os.getenv("DB_HOST"),
                    database=os.getenv("DB_NAME"),
                    user=os.getenv("DB_USER"),
                    password=os.getenv("DB_PASSWORD"),
                    port='5432'  # Puerto predeterminado de PostgreSQL
            )
            # Si la conexión tiene éxito, establece db_ready a True para salir del bucle
            db_ready = True
            conn.close()
            print("¡La base de datos está lista!")
        except psycopg2.OperationalError as e:
            print("Esperando a que la base de datos esté disponible...")
            time.sleep(1)













    # async def __init__(self) -> None:
    #     connected = False
    #     while not connected:
    #         try:
    #             self.connection = await psycopg2.connect(
    #                 host=os.getenv("DB_HOST"),
    #                 database=os.getenv("DB_NAME"),
    #                 user=os.getenv("DB_USER"),
    #                 password=os.getenv("DB_PASSWORD")
    #             )
    #             self.cursor = await self.connection.cursor()
    #             connected = True
    #         except DatabaseError as e:
    #             print(f"Error connecting to the database: {e}")
    #             await asyncio.sleep(2)
    
    def execute_query(self, query, params=None):
        self.cursor.execute(query, params or None)
        self.connection.commit()
        return self.cursor
    
    def close_connection(self):
        self.cursor.close()
        self.connection.close()
    
    def query_error_handler(self):
        self.connection.rollback()