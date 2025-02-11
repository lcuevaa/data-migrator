from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_tipos_operacion():
    print("Iniciando la migracion de la VISTA de Tipos de operaciones")
    
    # Consulta de datos en sql server
    sql_query = "SELECT * FROM VIEW_TIPOS_OPERACION"
    rows = fetch_sql_data(sql_query)
    
    if not rows:
        print("No se encontraron datos nuevos para migrar")
        return
    
    # Insersion de los datos en postgres
    
    insert_query ="""
        INSERT INTO tipos_operacion (
            tipo_operacion_id,
            tipo_operacion_nombre)
        VALUES %s
        ON CONFLICT (tipo_operacion_id) DO NOTHING
    """
    # Llamar a la función de inserción y capturar el número de filas insertadas
    inserted_count =  insert_postgres_data(insert_query, rows)
    
    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar")
    else:
        print(f"Migrados {inserted_count} registros")
    
    
    

