from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_sucursales():
    print("Migrando vista PUNTO DE EMISION (SUCURSALES)...")

    # Consulta de datos en SQL Server
    sql_query = "SELECT * FROM VIEW_PUNTOEMISION"
    rows = fetch_sql_data(sql_query)

    if not rows:
        print("No se encontraron datos nuevos para migrar en sucursales")
        return

    # Inserción en PostgreSQL
    insert_query = """
        INSERT INTO puntos_emision (
            punto_emision_id,
            codigo_sunat,
            empresa,
            nombre_punto_emision,
            direccion,
            departamento,
            provincia,
            distrito
        )
        VALUES %s
        ON CONFLICT (punto_emision_id) DO NOTHING
    """
    inserted_count = insert_postgres_data(insert_query, rows)

    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar en sucursales")
    else:
        print(f"Migrados {inserted_count} registros de sucursales")
