from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_forma_pago():
    print("Migrando vista formas pago...")

    # Consulta de datos en SQL Server
    sql_query = "SELECT * FROM VIEW_FORMAS_PAGO"
    rows = fetch_sql_data(sql_query)

    if not rows:
        print("No se encontraron datos nuevos para migrar en formas pago")
        return

    # Inserción en PostgreSQL
    insert_query = """
        INSERT INTO formas_pago (
            forma_pago_id,
            descripcion,
            es_credito 
        )
        VALUES %s
        ON CONFLICT (forma_pago_id) DO NOTHING
    """
    inserted_count = insert_postgres_data(insert_query, rows)

    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar en formas pago")
    else:
        print(f"Migrados {inserted_count} registros de formas pago")
