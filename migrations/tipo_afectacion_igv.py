from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_tipo_afectacionIgv():
    print("Migrando vista tipo afectación igv...")

    # Consulta de datos en SQL Server
    sql_query = "SELECT * FROM VIEW_AFECTACION_IGV"
    rows = fetch_sql_data(sql_query)

    if not rows:
        print("No se encontraron datos nuevos para migrar en tipo afectación igv")
        return

    # Inserción en PostgreSQL
    insert_query = """
        INSERT INTO tipos_afectacion_igv (
            tipo_afectacion_id,
            descripcion
        )
        VALUES %s
        ON CONFLICT (tipo_afectacion_id) DO NOTHING
    """
    inserted_count = insert_postgres_data(insert_query, rows)

    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar en tipo afectación igv")
    else:
        print(f"Migrados {inserted_count} registros de tipo afectación igv")
