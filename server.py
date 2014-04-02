from flask import Flask, render_template, request, redirect, url_for, session
import random
import MySQLdb
import utils
app = Flask(__name__)
intensity = 1
currentUser = ''

@app.route('/')
def mainIndex( ):
  return render_template('index.html', curus = currentUser)

@app.route('/index.html')
def homeIndex( ):
  return render_template('index.html', curus = currentUser)

@app.route('/submittedInsults.html')
def submittedInsults( ):
  db = utils.db_connect()
  cur = db.cursor()
  rows = []
  
  query = "SELECT * from full_insults WHERE NOT user_submitted = NULL"
  cur.execute(query)
  rows = cur.fetchall()
  
  return render_template('submittedInsults.html', results=rows, curus = currentUser)



@app.route('/customize', methods=['POST','GET'])
def custom( ):
  db = utils.db_connect()
  cur = db.cursor()
  if currentUser == '':
    user = anonymous
  else:
      user = currentUser
  
  if request.method == 'POST':
    insult = request.form['insult']    
    query = "SELECT * FROM full_insults"
    cur.execute(query)
    possible = cur.fetchall()
    numpossible = len(possible)
    query = "INSERT INTO full_insults (insult, foreign_key, user_submitted) VALUES (" + str(insult) + "," + str(numpossible + 1) + "," + str(user) +")"
    cur.execute(query)
    db.commit( )
  return render_template('customize.html')


@app.route('/insult', methods=['POST','GET'])
def insult( ):
  db = utils.db_connect()
  cur = db.cursor()
  
  if request.method == 'POST':
    #Get the intensity from the form
    global intensity
    intensity = request.form['intense']

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

@app.route('/shakespeare', methods=['POST','GET'])
def shakespeare( ):
  db = utils.db_connect()
  cur = db.cursor()
  
  if request.method == 'POST':
    #Get the intensity from the form
    global intensity
    intensity = request.form['intense']
  
  query = "SELECT id FROM shakespeare_verbs WHERE intensity = '" + str(intensity) + "'"
  cur.execute(query)
  #get all the verbs of that intensity
  possible = cur.fetchall()
  numpossible = len(possible)
  #pick a random index to use
  rand = random.randint(0,numpossible-1)
  #get the value at that index
  target = possible[rand][0]
  #use that value as the id of the verb
  query = "SELECT verb FROM shakespeare_verbs WHERE id = " + str(target)
  cur.execute(query)
  verb = cur.fetchall()
  
  query = "SELECT id FROM shakespeare_nouns WHERE intensity = '" + str(intensity) + "'"
  cur.execute(query)
  #get all the verbs of that intensity
  possible = cur.fetchall()
  numpossible = len(possible)
  #pick a random index to use
  rand = random.randint(0,numpossible-1)
  #get the value at that index
  target = possible[rand][0]
  #use that value as the id of the verb
  query = "SELECT noun FROM shakespeare_nouns WHERE id = " + str(target)
  cur.execute(query)
  noun = cur.fetchall()
  
  query = "SELECT id FROM shakespeare_adjectives WHERE intensity = '" + str(intensity) + "'"
  cur.execute(query)
  #get all the verbs of that intensity
  possible = cur.fetchall()
  numpossible = len(possible)
  #pick a random index to use
  rand = random.randint(0,numpossible-1)
  #get the value at that index
  target = possible[rand][0]
  #use that value as the id of the verb
  query = "SELECT adjective FROM shakespeare_adjectives WHERE id = " + str(target)
  cur.execute(query)
  adjective = cur.fetchall()
  return render_template('shakespeare.html', verb = verb, noun = noun, adjective = adjective)

@app.route('/register', methods=['GET', 'POST'])
def register():
  global currentUser
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  # if user typed in a post ...
  if request.method == 'POST':
    un = request.form['username']
    pw = request.form['pw']
    query = "INSERT INTO users (username) VALUES ('%s')" % (un)
    cur.execute(query)
    db.commit( )
    query2 = "SELECT id FROM users WHERE username = '%s'" % (un)
    cur.execute(query2)
    tida = cur.fetchall( )
    tid = tida[0]['id']
    query3 = "INSERT INTO user_passwords (password, user_id) VALUES (SHA2('%s',0), %d)" % (pw, tid)
    cur.execute(query3)
    db.commit( )
    currentUser = un
    return redirect(url_for('mainIndex'))
  return render_template('register.html', curus = currentUser)
  
@app.route('/login', methods=['GET', 'POST'])
def login():
  global currentUser
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  if request.method == 'POST':
    username = request.form['username']
    pw = request.form['pw']
    query = "SELECT * FROM user_passwords AS up INNER JOIN users AS u ON up.user_id = u.id WHERE u.username = '%s' AND up.password = SHA2('%s',0)" % (username, pw)
    cur.execute(query)
    if cur.fetchone( ):
      currentUser = username
      return redirect(url_for('mainIndex'))
  return render_template('login.html', curus = currentUser)
  
@app.route('/logout', methods=['GET','POST'])
def logout():
    global currentUser
    db = utils.db_connect()
    cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
    # if user typed in a post ...
    if request.method == 'POST':
      currentUser = ''
      return redirect(url_for('mainIndex'))
    return render_template('logout.html', curus = currentUser)
  
  
@app.route('/responses', methods=['POST','GET'])
def responses( ):
  db = utils.db_connect()
  cur = db.cursor()
  
  #/***************************/
  #/****# shakespeare insults *****/
  
  query = "SELECT COUNT(*) FROM shakespeare_verbs"
  cur.execute(query)
  numverbs = cur.fetchall()
  rand = random.randint(1,numverbs[0][0])
  query = "SELECT verb FROM shakespeare_verbs WHERE id = " + str(rand)
  cur.execute(query)
  verb1 = cur.fetchall()
  
  query = "SELECT COUNT(*) FROM shakespeare_nouns"
  cur.execute(query)
  numnouns = cur.fetchall()
  rand = random.randint(1,numnouns[0][0])
  query = "SELECT noun FROM shakespeare_nouns WHERE id = " + str(rand)
  cur.execute(query)
  noun1 = cur.fetchall()
  
  query = "SELECT COUNT(*) FROM shakespeare_adjectives"
  cur.execute(query)
  numadjectives = cur.fetchall()
  rand = random.randint(1,numadjectives[0][0])
  query = "SELECT adjective FROM shakespeare_adjectives WHERE id = " + str(rand)
  cur.execute(query)
  adjective1 = cur.fetchall()

  #/***************************/
  #/****# regular insults *****/
  

  query = "SELECT id FROM insult_verbs"
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
  query = "SELECT id FROM insult_nouns"
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
  query = "SELECT id FROM insult_adjectives"
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

  #/***************************/
  #/******# long insult *******/

  query = "SELECT fi.insult FROM full_insults AS fi INNER JOIN shakespeare_adjectives AS sa ON fi.foreign_key = sa.id AND sa.id = " + str(target)
  cur.execute(query)
  fullInsult = cur.fetchall()
  
  
  #/**************************/
  
  return render_template('responses.html', verb1 = verb1, noun1 = noun1, adjective1 = adjective1, verb = verb, noun = noun, adjective = adjective, fullInsult = fullInsult)

if __name__ == '__main__':
  app.run(host='0.0.0.0',port=3000)
