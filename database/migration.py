from migrations.empresas import migrate_empresas
from migrations.sucursales import migrate_sucursales
from migrations.productos import migrate_productos
from migrations.unidades_medida import migrate_unidades_medida
from migrations.tipo_afectacion_igv import migrate_tipo_afectacionIgv
from migrations.forma_pago import migrate_forma_pago
def migrate_data():
    print("Iniciando la migracion de datos...")
    
    # Migrar cada tabla/vista de forma independiente
    migrate_empresas()
    migrate_sucursales()
    migrate_productos()
    migrate_unidades_medida()
    migrate_tipo_afectacionIgv()
    migrate_forma_pago()
    
    
    
    
    print("Migración de datos finalizada.")

