from utils.oracleUtils import retrieve_id


wildcard = '?'
select_all = 'SELECT * FROM ?'
select_attributes = 'SELECT ? FROM ?'
get_all_table_name = 'select table_name from all_all_tables where owner=\'FRUIT\''
select_detail = 'SELECT * FROM ? WHERE ? = ?'


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


def replace_query_wildcard(query: str, new_value: str):
    return query.replace(wildcard, new_value, 1)



