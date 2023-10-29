from db.db_connection import DBConnection
from services import api_service as ser

db = DBConnection()

def insert_nodo(nodo):
    query = "SELECT regalias.insert_nodo(%s, %s, %s, %s, %s, %s)"
    node = ser.create_nodo(nodo)
    return db.execute_query(query, node)
