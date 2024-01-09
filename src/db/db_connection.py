import psycopg2
from psycopg2 import DatabaseError
import os
from dotenv import load_dotenv
import asyncio

load_dotenv()

class DBConnection:
    async def __init__(self) -> None:
        connected = False
        while not connected:
            try:
                self.connection = await psycopg2.connect(
                    host=os.getenv("DB_HOST"),
                    database=os.getenv("DB_NAME"),
                    user=os.getenv("DB_USER"),
                    password=os.getenv("DB_PASSWORD")
                )
                self.cursor = await self.connection.cursor()
                connected = True
            except DatabaseError as e:
                print(f"Error connecting to the database: {e}")
                await asyncio.sleep(2)
    
    def execute_query(self, query, params=None):
        self.cursor.execute(query, params or None)
        self.connection.commit()
        return self.cursor
    
    def close_connection(self):
        self.cursor.close()
        self.connection.close()
    
    def query_error_handler(self):
        self.connection.rollback()