import psycopg2
from psycopg2 import DatabaseError
import os
from dotenv import load_dotenv

load_dotenv()

class DBConnection:
    def __init__(self) -> None:
        try:
            self.connection = psycopg2.connect(
                host=os.getenv("DB_HOST"),
                database=os.getenv("DB_NAME"),
                user=os.getenv("DB_USER"),
                password= os.getenv("DB_PASSWORD")
            )
            self.cursor = self.connection.cursor()
        except DatabaseError as e:
            raise e
    
    def execute_query(self, query, params=None):
        self.cursor.execute(query, params or None)
        self.connection.commit()
        return self.cursor