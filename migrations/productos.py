from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_productos():
    print("Migrando vista PRODUCTOS...")

    # Consulta de datos en SQL Server
    sql_query = "SELECT * FROM VIEW_PRODUCTOS"
    rows = fetch_sql_data(sql_query)

    if not rows:
        print("No se encontraron datos nuevos para migrar en productos")
        return

    # Inserción en PostgreSQL
    insert_query = """
        INSERT INTO productos (
            producto_id,
            producto_codigo,
            codigo_sunat,
            empresa_id,
            descripcion,
            unidad_id,
            peso,
            tipo_afectacion_id
        )
        VALUES %s
        ON CONFLICT (producto_id) DO NOTHING
    """
    inserted_count = insert_postgres_data(insert_query, rows)

    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar en productos")
    else:
        print(f"Migrados {inserted_count} registros de productos")
