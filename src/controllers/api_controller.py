from db.db_connection import DBConnection
from services import api_service as ser

db = DBConnection()

def get_all():
    try:
        query = "SELECT regalias.get_all()"
        data = db.execute_query(query).fetchall()
        data = ser.show_data(data)
        return data
    except Exception as e:
        db.query_error_handler()
        raise e
    

def insert_nodo(nodo):
    try:
        query = "SELECT regalias.insert_nodo(%s, %s, %s, %s, %s, %s)"
        node = ser.create_nodo(nodo)
        return db.execute_query(query, node)
    except Exception as e:
        db.query_error_handler()
        raise e