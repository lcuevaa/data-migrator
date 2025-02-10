from migrations.empresas import migrate_empresas
from migrations.sucursales import migrate_sucursales
from migrations.productos import migrate_productos
from migrations.unidades_medida import migrate_unidades_medida
from migrations.tipo_afectacion_igv import migrate_tipo_afectacionIgv
from migrations.forma_pago import migrate_forma_pago
from migrations.tipos_documento import migrate_tipos_documento_tributarios
from migrations.contribuyente import migrate_contribuyentes
def migrate_data():
    print("Iniciando la migracion de datos...")
    
    # Migrar cada tabla/vista de forma independiente
    # migrate_empresas()
    # migrate_sucursales()
    # migrate_productos()
    # migrate_unidades_medida()
    # migrate_tipo_afectacionIgv()
    # migrate_forma_pago()
    migrate_tipos_documento_tributarios()
    migrate_contribuyentes () #aun falta crear la tabla en la bd
    
    print("Migración de datos finalizada.")

