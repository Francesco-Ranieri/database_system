import cx_Oracle

user = 'FRUIT'
password = 'FRUIT'
dns = 'localhost:1521/ORCLCDB'
lib_dir = 'C:\\Users\\ranie\\Desktop\\workspace\\database_system\\resources\\instantclient-basic-windows\\instantclient_21_7'


def get_db_connection():

    cx_Oracle.init_oracle_client(lib_dir=lib_dir)
    pool = cx_Oracle.SessionPool(user=user, password=password,
                                dsn=dns, min=2,
                                max=5, increment=1, encoding="UTF-8")

    # Acquire a connection from the pool
    return pool.acquire()

def retrieve_id(table_name: str):
    if table_name in ['FRUIT_TAB']:
        return 'NAME_FRUIT' 
    if table_name in ['OFFER_CUSTOMER_TAB']:
        return 'ID_OFFER' 
    return 'ID_' + '_'.join(table_name.split('_')[:-1])
