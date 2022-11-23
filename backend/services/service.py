from utils.jsonUtils import query_to_json_format
from utils.queryUtils import get_select_all_query, get_all_table_name, select_detail, get_info_per_id


def collect_all_info(table_name: str, connection):
    query = get_select_all_query(table_name)
    return execute_query(connection, query)


def collect_all_table_names(connection):
    return execute_query(connection, get_all_table_name)

def collect_info_per_id(table_name: str, id:int, connection):
    query = get_info_per_id(table_name, id)
    return execute_query(connection, query)


def execute_query(connection, query):
    cursor = connection.cursor()
    cursor.execute(query)
    res = query_to_json_format(cursor)
    cursor.close()
    return res