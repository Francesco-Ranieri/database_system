import json


def query_to_json_format(cursor):
    res = {}
    response = []
    for elem in cursor:
        result = {}
        for index, value in enumerate(elem):
            field = cursor.description[index][0]
            result[field] = value
        response.append(result)
        res['res'] = response
    return json.dumps(res)
