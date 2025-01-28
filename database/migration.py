from migrations.empresas import migrate_empresas
from migrations.sucursales import migrate_sucursales

def migrate_data():
    print("Iniciando la migracion de datos...")
    
    # Migrar cada tabla/vista de forma independiente
    migrate_empresas()
    migrate_sucursales()
    
    print("Migración de datos finalizada.")

