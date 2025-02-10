from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_unidades_medida():
    print("Migrando vista UNIDAD MEDIDA ")

    # Consulta de datos en SQL Server
    sql_query = "SELECT * FROM VIEW_UNIDADMEDIDA"
    rows = fetch_sql_data(sql_query)

    if not rows:
        print("No se encontraron datos nuevos para migrar en unidades de medida")
        return

    # Inserción en PostgreSQL
    insert_query = """
        INSERT INTO unidades_medida (
            unidad_id,
            unidad_nombre,
            codigo_internacion
        )
        VALUES %s
        ON CONFLICT (unidad_id) DO NOTHING
    """
    inserted_count = insert_postgres_data(insert_query, rows)

    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar en unidades de medida")
    else:
        print(f"Migrados {inserted_count} registros de unidades de medida")
