import psycopg2 
from psycopg2.extras import execute_values
from config import POSTGRES_CONFIG
def connect_postgres():
    return psycopg2.connect(**POSTGRES_CONFIG)

def insert_postgres_data(query, data):
    try:
        conn = connect_postgres()
        cursor = conn.cursor()
        # Usar execute_values para insertar múltiples filas a la vez
        execute_values(cursor, query, data)
        
        # Obtener el número de filas realmente insertadas
        inserted_count = cursor.rowcount
        
        conn.commit()
        cursor.close()
        conn.close()
        
        return inserted_count
    except Exception as e:
        
        print(f"Error durante la inserción: {e}")
        return 0
    