from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_departamentos():
    print("Iniciando la migracion de la VISTA de Departamentos")
    
    # Consulta de datos en sql server
    sql_query = "SELECT * FROM VIEW_DEPARTAMENTOS"
    rows = fetch_sql_data(sql_query)
    
    if not rows:
        print("No se encontraron datos nuevos para migrar")
        return
    
    # Insersion de los datos en postgres
    
    insert_query ="""
        INSERT INTO departamentos (
            departamento_id,
            departamento_nombre)
        VALUES %s
        ON CONFLICT (departamento_id) DO NOTHING
    """
    # Llamar a la función de inserción y capturar el número de filas insertadas
    inserted_count =  insert_postgres_data(insert_query, rows)
    
    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar")
    else:
        print(f"Migrados {inserted_count} registros")
    
    
    

