from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_empresas():
    print("Iniciando la migracion de la VISTA de EMPRESAS")
    
    # Consulta de datos en sql server
    sql_query = "SELECT * FROM VIEW_EMPRESAS"
    rows = fetch_sql_data(sql_query)
    
    if not rows:
        print("No se encontraron datos nuevos para migrar")
        return
    
    # Insersion de los datos en postgres
    
    insert_query ="""
        INSERT INTO empresas (
            EmpresaId, 
            TDIdentificacionId,
            NroRuc,
            RazonSocial,
            Direccion)
        VALUES %s
        ON CONFLICT (EmpresaId) DO NOTHING
    """
    # Llamar a la función de inserción y capturar el número de filas insertadas
    inserted_count =  insert_postgres_data(insert_query, rows)
    
    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar")
    else:
        print(f"Migrados {inserted_count} registros")
    
    
    

