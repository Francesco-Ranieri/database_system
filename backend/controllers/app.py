from flask_cors import CORS
from flask import Flask

import sys
sys.path.append('..')

from utils.oracleUtils import get_db_connection
from services.service import collect_all_table_names, collect_all_info, collect_info_per_id


app = Flask(__name__)
CORS(app)
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
def get_all_table_per_id(table_name:str, id:int):
    return collect_info_per_id(table_name, id, connection)


if __name__== "__main__":
    app.run(debug=True)