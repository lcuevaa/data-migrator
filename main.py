from database.migration import migrate_data
from scheduler import schedule_migration

if __name__ == "__main__":
    # Realiza la migracion inicial
    migrate_data()
    
    #Programa la migración segun el intervalo de tiempo establecida (10 min)
    schedule_migration(interval_minutes=10) #Se puede cambiar segun la necesidad del tiempo en que se quiere automatizar la migración de la informacion