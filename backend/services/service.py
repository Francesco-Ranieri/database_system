from utils.oracleUtils import *
from utils.jsonUtils import *
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


def insert_new_row(table_name, body:json, connection):
    query = insert_row_query(table_name, body)
    print(f"-------------INSERT \n\n{query}\n\n-------------\n")
    execute_query(connection, query, body)


def update_existing_row(table_name, body, connection):
    query = update_row_query(table_name, body)
    print(f"-------------UPDATE \n\n{query}\n\n-------------\n")
    execute_query(connection, query, body)


def delete_existing_row(table_name, id, connection):
    query = delete_row_query(table_name, id)
    print(f"-------------DELETE \n\n{query}\n\n-------------\n")
    execute_query(connection, query)


def get_expiring_fruits(connection):
    print(f"-------------EXPIRING FRUITS-------------\n")
    today_date = datetime.date(datetime.now())
    body = date_to_json(today_date)
    return query_to_json_format(execute_query(connection, get_expiring_fruit, body))


def buy_fruit(body, connection):
    print(f"-------------BUY FRUITS-------------\n")
    execute_query(connection, buy_offer_fruit, {"weight": body["DISCOUNTED_WEIGHT"], "name_fruit": body['FRUIT_FK']})


def execute_query(connection, query, body={}):
    cursor = connection.cursor()
    if body:
        cursor.execute(query, normalize_body(body))
    else:
        cursor.execute(query)
    return cursor