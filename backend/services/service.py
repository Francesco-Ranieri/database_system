from utils.oracleUtils import get_db_connection
from utils.jsonUtils import query_to_json_format
from utils.queryUtils import *

def collect_all_info(table_name: str, connection):
    query = get_select_all_query(table_name)
    return query_to_json_format(execute_query(connection, query))


def collect_all_table_names(connection):
    return query_to_json_format(execute_query(connection, get_all_table_name))


def collect_info_per_id(table_name: str, id:int, connection):
    query = get_info_per_id(table_name, id)
    print(f"-------------GETBYID \n\n{query}\n\n-------------\n")
    return query_to_json_format(execute_query(connection, query))


def insert_new_row(table_name, body, connection):
    query = insert_row_query(table_name, body)
    print(f"-------------INSERT \n\n{query}\n\n-------------\n")
    execute_query(connection, query)


def update_existing_row(table_name, body, connection):
    query = update_row_query(table_name, body)
    print(f"-------------UPDATE \n\n{query}\n\n-------------\n")
    execute_query(connection, query)


def delete_existing_row(table_name, id, connection):
    query = delete_row_query(table_name, id)
    print(f"-------------DELETE \n\n{query}\n\n-------------\n")
    execute_query(connection, query)

def execute_query(connection, query):
    cursor = connection.cursor()
    cursor.execute(query)
    return cursor