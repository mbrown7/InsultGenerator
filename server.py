from flask import Flask, render_template, request
import random
import MySQLdb
import utils
app = Flask(__name__)
intensity = 1

@app.route('/')
def mainIndex( ):
  return render_template('index.html')

@app.route('/index.html')
def homeIndex( ):
  return render_template('index.html')

@app.route('/insult', methods=['POST','GET'])
def insult( ):
  db = utils.db_connect()
  cur = db.cursor()
  
  if request.method == 'POST':
    #Get the intensity from the form
    global intensity
    intensity = request.form['intense']
  
  print intensity
  #Getting the verb
  #search based on intensity
  query = "SELECT id FROM insult_verbs WHERE intensity = '" + str(intensity) + "'"
  cur.execute(query)
  #get all the verbs of that intensity
  possible = cur.fetchall()
  numpossible = len(possible)
  #pick a random index to use
  rand = random.randint(0,numpossible-1)
  #get the value at that index
  target = possible[rand][0]
  #use that value as the id of the verb
  query = "SELECT verb FROM insult_verbs WHERE id = " + str(target)
  cur.execute(query)
  verb = cur.fetchall()
  
  #Getting the noun
  #search based on intensity
  query = "SELECT id FROM insult_nouns WHERE intensity = '" + str(intensity) + "'"
  cur.execute(query)
  #get all the verbs of that intensity
  possible = cur.fetchall()
  numpossible = len(possible)
  #pick a random index to use
  rand = random.randint(0,numpossible-1)
  #get the value at that index
  target = possible[rand][0]
  #use that value as the id of the verb
  query = "SELECT noun FROM insult_nouns WHERE id = " + str(target)
  cur.execute(query)
  noun = cur.fetchall()
  
  #Getting the adjective
  #search based on intensity
  query = "SELECT id FROM insult_adjectives WHERE intensity = '" + str(intensity) + "'"
  cur.execute(query)
  #get all the verbs of that intensity
  possible = cur.fetchall()
  numpossible = len(possible)
  #pick a random index to use
  rand = random.randint(0,numpossible-1)
  #get the value at that index
  target = possible[rand][0]
  #use that value as the id of the verb
  query = "SELECT adjective FROM insult_adjectives WHERE id = " + str(target)
  cur.execute(query)
  adjective = cur.fetchall()
  return render_template('insult.html', verb = verb, noun = noun, adjective = adjective)

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