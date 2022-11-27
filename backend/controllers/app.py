import json
from flask_cors import CORS
from flask import Flask, request
from datetime import datetime

import sys
sys.path.append('..')

from utils.oracleUtils import get_db_connection
from services.service import *


app = Flask(__name__)
cors = CORS(app)
connection = get_db_connection()


@app.route('/')
def init():
    return "Hello there !!, Backend is working"


@app.route('/get-all-info/<table_name>')
def get_all_info(table_name: str):
    return collect_all_info(table_name, connection)


@app.route('/get-all-tables')
def get_all_table():
    return collect_all_table_names(connection)


@app.route('/get-all-info/<table_name>/<id>')
def get_all_table_per_id(table_name:str, id):
    return collect_info_per_id(table_name, id, connection)


@app.route('/insert/<table_name>', methods=['POST'])
def insert_table_info(table_name:str):
    req_data = request.json
    insert_new_row(table_name, req_data, connection)
    connection.commit()
    return {"status": "OK"}


@app.route('/update/<table_name>', methods=['POST'])
def update_table_info(table_name:str):
    req_data = request.json
    update_existing_row(table_name, req_data, connection)
    connection.commit()
    return {"status": "OK"}


@app.route('/delete/<table_name>/<id>', methods=['POST'])
def delete_table_info(table_name:str, id:int):
    delete_existing_row(table_name, id, connection)
    connection.commit()
    return {"status": "OK"}


@app.route('/get_expiring_fruits', methods=['GET'])
def get_expiring_fruits_info():
    res = get_expiring_fruits(connection)
    connection.commit()
    return res


@app.route('/buy-offer-fruit', methods=['POST'])
def buy_fruit_customer():
    body = request.json
    buy_fruit(body, connection)
    connection.commit()
    return {"status": "OK"}


if __name__== "__main__":
    app.run(debug=True)