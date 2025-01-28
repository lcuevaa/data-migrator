import pyodbc 
from config import SQL_SERVER_CONFIG

# def conenect_sql_server
#     conn_str=(
#         f"(DRIVER)={{ODBC Driver 17 for SQL Server}};"
#         f"SERVER={SQL_SERVER_CONFIG['server']};"
#         f"DATABASE={SQL_SERVER_CONFIG['database']};"
#         f"UID={SQL_SERVER_CONFIG['username']}"
#         f"PWD={SQL_SERVER_CONFIG['password']}"
#     )
#     return pyodbc.connect(conn_str)

def connect_sql_server():
    conn_str = (
        f"DRIVER={{ODBC Driver 17 for SQL Server}};"
        f"SERVER={SQL_SERVER_CONFIG['server']};"
        f"DATABASE={SQL_SERVER_CONFIG['database']};"
        f"Trusted_Connection=yes;"
    )
    return pyodbc.connect(conn_str)


def fetch_sql_data(query, params=None):
    conn = connect_sql_server()
    cursor = conn.cursor()
    cursor.execute(query, params or [])
    rows = cursor.fetchall()
    conn.close()
    return rows

