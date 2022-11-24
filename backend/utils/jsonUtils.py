import json
from datetime import datetime


def query_to_json_format(cursor):
    res = {}
    response = []
    for elem in cursor:
        print(elem)
        result = {}
        for index, value in enumerate(elem):
            field = cursor.description[index][0]
            if "DATE" in field:
                result[field] = str(value).split(" ")[0]
            else:
                result[field] = value
        response.append(result)
        res['res'] = response
    return json.dumps(res, default=str)


def normalize_body(body:json):
    for key in body.keys():
        if 'date' in key.lower():
            body[key] = datetime.strptime(body[key], "%Y-%m-%d")
    return body


def date_to_json(date):
    return {"year": date.year, 
            "month": date.month, 
            "day": date.day}
