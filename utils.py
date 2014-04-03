import MySQLdb

DATABASE='insult_generator'
DB_USER = 'blogUser'
DB_PASSWORD = 'blogPassword'
HOST = 'localhost'

def db_connect():
  return MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE)
