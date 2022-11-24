import json
from utils.oracleUtils import retrieve_id


wildcard = '?'
select_all = 'SELECT * FROM ?'
select_attributes = 'SELECT ? FROM ?'
get_all_table_name = 'select table_name from all_all_tables where owner=\'FRUIT\''
select_detail = 'SELECT * FROM ? WHERE ? = \'?\''
insert_row = 'INSERT INTO ? (?) VALUES (?)'
update_row = 'UPDATE ? SET ? WHERE ? = \'?\''
delete_row = 'DELETE FROM ? WHERE ? = \'?\''


def replace_query_wildcards(query: str, attributes: list, table_name: str):
    filters = ','.join(attributes)
    query = replace_query_wildcard(query, filters)
    return replace_query_wildcard(query, table_name)


def get_select_all_query(table_name: str):
    return replace_query_wildcard(select_all, table_name)


def get_info_per_id(table_name: str, id:int):
    query = replace_query_wildcard(select_detail, table_name)
    id_name = retrieve_id(table_name)
    query = replace_query_wildcard(query, id_name)
    return replace_query_wildcard(query, id)


def insert_row_query(table_name: str, body:json):
    query = replace_query_wildcard(insert_row, table_name)
    fields = ','.join(body.keys())
    query = replace_query_wildcard(query, fields)
    values = []
    for value in body.values():
        values.append(f"\'{value}\'")
    values = ','.join(values)
    return replace_query_wildcard(query, values)


def update_row_query(table_name: str, body:json):
    id_name = retrieve_id(table_name)
    query = replace_query_wildcard(update_row, table_name)
    set_section = ''
    for (field, values) in zip(body.keys(), body.values()):
        set_section += f"{field} = \'{values}\',"
    query = replace_query_wildcard(query, set_section[:-1])
    query = replace_query_wildcard(query, id_name)
    return replace_query_wildcard(query, f"{body[id_name]}")


def delete_row_query(table_name:str, id:int):
    query = replace_query_wildcard(delete_row, table_name)
    id_name = retrieve_id(table_name)
    query = replace_query_wildcard(query, id_name)
    return replace_query_wildcard(query, id)

def replace_query_wildcard(query: str, new_value: str):
    return query.replace(wildcard, new_value, 1)



