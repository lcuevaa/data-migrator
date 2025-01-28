import schedule
import time
from database.migration import migrate_data

def schedule_migration(interval_minutes=10):
    
    schedule.every(interval_minutes).minutes.do(migrate_data)
    
    print(f"Programando migracion cada {interval_minutes} minutos")
    
    while True:
        schedule.run_pending()
        time.sleep(1)
    