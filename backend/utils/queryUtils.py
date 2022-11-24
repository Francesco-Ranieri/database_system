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
get_expiring_fruit = '''
SELECT DISTINCT
    F.DATE_ARRIVAL + FR.DAYS_FRESHNESS AS EXPIRATION_DATE,
    LISTAGG(F.NAME_FRUIT, ',') WITHIN GROUP (ORDER BY NAME_FRUIT)
        OVER (PARTITION BY  F.DATE_ARRIVAL + FR.DAYS_FRESHNESS) as "FRUITS"
FROM FRUIT_TAB F 
JOIN FRESHNESS_TAB FR
    ON F.FRESHNESS_FK = FR.ID_FRESHNESS
WHERE 
    extract(year from  F.DATE_ARRIVAL + FR.DAYS_FRESHNESS) = :year AND
    extract(month from  F.DATE_ARRIVAL + FR.DAYS_FRESHNESS) = :month AND
    extract(day from  F.DATE_ARRIVAL + FR.DAYS_FRESHNESS) >= :day AND 
    extract(day from  F.DATE_ARRIVAL + FR.DAYS_FRESHNESS) <= :day + 2
    
ORDER BY EXPIRATION_DATE
    '''


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
    for key in body.keys():
        values.append(f":{key}")
    values = ','.join(values)
    return replace_query_wildcard(query, values)


def update_row_query(table_name: str, body:json):
    id_name = retrieve_id(table_name)
    query = replace_query_wildcard(update_row, table_name)
    set_section = ''
    for key in body.keys():
        set_section += f"{key} = :{key},"
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



