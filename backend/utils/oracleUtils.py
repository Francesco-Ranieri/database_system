import cx_Oracle

user = 'FRUIT'
password = 'FRUIT'
dns = 'localhost:1521/ORCLCDB'
lib_dir = 'C:\\Users\\ranie\\Desktop\\workspace\\database_system\\instantclient-basic-windows\\instantclient_21_7'


def get_db_connection():
    cx_Oracle.init_oracle_client(lib_dir)
    return cx_Oracle.connect(user, password, dns)


def retrieve_id(table_name: str):
    if table_name in ['FRUIT_TAB', 'FRESHNESS_TAB']:
        return 'NAME_FRUIT' 
    return 'ID_' + '_'.join(table_name.split('_')[:-1])
