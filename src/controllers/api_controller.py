from db.db_connection import DBConnection
from services import api_service as ser

db = DBConnection()

def get_all():
    query = "SELECT regalias.get_all()"
    data = db.execute_query(query).fetchall()
    print("La data de mierda: ", data)
    data = ser.show_data(data)
    return data
    

def insert_nodo(nodo):
    query = "SELECT regalias.insert_nodo(%s, %s, %s, %s, %s, %s)"
    node = ser.create_nodo(nodo)
    return db.execute_query(query, node)
