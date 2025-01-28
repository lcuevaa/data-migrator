from database.sql_server import fetch_sql_data
from database.postgres import insert_postgres_data

def migrate_sucursales():
    print("Migrando vista SUCURSALES...")

    # Consulta de datos en SQL Server
    sql_query = "SELECT * FROM VIEW_SUCURSALES"
    rows = fetch_sql_data(sql_query)

    if not rows:
        print("No se encontraron datos nuevos para migrar en sucursales")
        return

    # Inserción en PostgreSQL
    insert_query = """
        INSERT INTO sucursales (
            EmpresaId, SucursalId,  RazonSocial, NombreComercial, CodigoSucursal,
            CodEmpresa, Direccion, CodSucursal, EsPuntoVenta, Siglas, NroRuc, Estado
        )
        VALUES %s
        ON CONFLICT (SucursalId) DO NOTHING
    """
    inserted_count = insert_postgres_data(insert_query, rows)

    if inserted_count == 0:
        print("No se encontraron datos nuevos para migrar en sucursales")
    else:
        print(f"Migrados {inserted_count} registros de sucursales")
