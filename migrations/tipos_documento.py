from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_tipos_documento_tributarios():
    print("Migrando vista tipos documento tributarios...")

    # Consulta de datos en SQL Server
    sql_query = "SELECT * FROM VIEW_TIPOS_DOCUMENTO"
    rows = fetch_sql_data(sql_query)

    if not rows:
        print("No se encontraron datos nuevos para migrar en tipos_documento")
        return

    # Inserción en PostgreSQL
    insert_query = """
        INSERT INTO tipos_documento_tributarios (
            td_id,
            descripcion,
            nombre_documento
        )
        VALUES %s
        ON CONFLICT (td_id) DO NOTHING
    """
    inserted_count = insert_postgres_data(insert_query, rows)

    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar en tipo documento tributarios")
    else:
        print(f"Migrados {inserted_count} registros de tipos documentos tributarios")
