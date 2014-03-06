from flask import Flask, render_template
from random import randrange
app = Flask(__name__)

@app.route('/')
def mainIndex( ):
  db = utils.db_connect()
  cur = db.cursor()
  
  random1 = random.randrange(1,10+1)
  random2 = random.randrange(1,10+1)
  random3 = random.randrange(1,10+1)
  
  cur.execute('select verb from insult_verb where id = 'random1')
  cur.execute('select adjective from insult_adjective where id = 'random2')
  cur.execute('select noun from insult_noun where id = 'random3')
  rows = cur.fetchall()
    
  return render_template('index.html',posts=rows)

@app.route('/index.html')
def homeIndex( ):
  db = utils.db_connect()
  cur = db.cursor()
  
  cur.execute('select verb from insult_verb where id = 1')
  cur.execute('select adjective from insult_adjective where id = 1')
  cur.execute('select noun from insult_noun where id = 1')
  rows = cur.fetchall()
    
  return render_template('index.html', posts=rows)



if __name__ == '__main__':
  app.run(host='0.0.0.0',port=3000)
