from flask import Flask, render_template
import random
import MySQLdb
import utils
app = Flask(__name__)

@app.route('/')
def mainIndex( ):
  db = utils.db_connect()
  cur = db.cursor()
  query = "SELECT COUNT(*) FROM insult_verbs"
  cur.execute(query)
  numverbs = cur.fetchall()
  rand = random.randint(1,numverbs[0][0])
  query = "SELECT verb FROM insult_verbs WHERE id = " + str(rand)
  cur.execute(query)
  verb = cur.fetchall()
  
  query = "SELECT COUNT(*) FROM insult_nouns"
  cur.execute(query)
  numnouns = cur.fetchall()
  rand = random.randint(1,numnouns[0][0])
  query = "SELECT noun FROM insult_nouns WHERE id = " + str(rand)
  cur.execute(query)
  noun = cur.fetchall()
  
  query = "SELECT COUNT(*) FROM insult_adjectives"
  cur.execute(query)
  numadjectives = cur.fetchall()
  rand = random.randint(1,numadjectives[0][0])
  query = "SELECT adjective FROM insult_adjectives WHERE id = " + str(rand)
  cur.execute(query)
  adjective = cur.fetchall()
  return render_template('index.html', verb = verb, noun = noun, adjective = adjective)

@app.route('/index.html')
def homeIndex( ):
  db = utils.db_connect()
  cur = db.cursor()
  query = "SELECT COUNT(*) FROM insult_verbs"
  cur.execute(query)
  numverbs = cur.fetchall()
  rand = random.randint(1,numverbs[0][0])
  query = "SELECT verb FROM insult_verbs WHERE id = " + str(rand)
  cur.execute(query)
  verb = cur.fetchall()
  
  query = "SELECT COUNT(*) FROM insult_nouns"
  cur.execute(query)
  numnouns = cur.fetchall()
  rand = random.randint(1,numnouns[0][0])
  query = "SELECT noun FROM insult_nouns WHERE id = " + str(rand)
  cur.execute(query)
  noun = cur.fetchall()
  
  query = "SELECT COUNT(*) FROM insult_adjectives"
  cur.execute(query)
  numadjectives = cur.fetchall()
  rand = random.randint(1,numadjectives[0][0])
  query = "SELECT adjective FROM insult_adjectives WHERE id = " + str(rand)
  cur.execute(query)
  adjective = cur.fetchall()
  return render_template('index.html', verb = verb, noun = noun, adjective = adjective)

@app.route('/about.html')
def about( ):
  return render_template('about.html')

@app.route('/contact.html')
def contact( ):
  return render_template('contact.html')

@app.route('/hairstyle.html')
def hairstyle( ):
  return render_template('hairstyle.html')

@app.route('/news.html')
def news( ):
  return render_template('news.html')

if __name__ == '__main__':
  app.run(host='0.0.0.0',port=3000)