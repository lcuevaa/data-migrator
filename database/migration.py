from migrations.empresas import migrate_empresas
from migrations.sucursales import migrate_sucursales
from migrations.productos import migrate_productos
from migrations.unidades_medida import migrate_unidades_medida
from migrations.tipo_afectacion_igv import migrate_tipo_afectacionIgv
from migrations.forma_pago import migrate_forma_pago
from migrations.tipos_documento import migrate_tipos_documento_tributarios
from migrations.contribuyente import migrate_contribuyentes
from migrations.tipos_identificacion import migrate_tipos_identificacion
from migrations.tipos_operacion import migrate_tipos_operacion
from migrations.departamentos import migrate_departamentos
from migrations.provincias import migrate_provincias
from migrations.distritos import migrate_distritos

def migrate_data():
    print("Iniciando la migración de datos...")
    
    # Migrar cada tabla/vista de forma independiente
    
    # migraciones comentadas para que puedas decidir qué ejecutar
    # migrate_tipo_afectacionIgv()
    # migrate_forma_pago()
    # migrate_tipos_documento_tributarios()  # Comentado en ambos casos, pero puedes descomentarlo si lo deseas
    migrate_contribuyentes() 
    # migrate_unidades_medida()
    # migrate_tipos_identificacion()
    # migrate_tipos_operacion()
    # migrate_departamentos()
    # migrate_provincias()
    # migrate_distritos()
    # migrate_empresas()
    # migrate_productos()  # Puede ser importante para tu flujo de migración
    # migrate_sucursales()  # Esta línea está en ambos bloques, por lo que no se pierde

    print("Migración de datos finalizada.")