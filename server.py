from flask import Flask, render_template, request, redirect, url_for, session
import random
import MySQLdb
import utils
app = Flask(__name__)
intensity = 1
currentUser = ''
app.secret_key = 'Zq4oA4Dqq3' 
globalLogin = False

@app.route('/')
def mainIndex( ):
  return render_template('index.html', curus = currentUser)

@app.route('/index.html')
def homeIndex( ):
  return render_template('index.html', curus = currentUser)

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

@app.route('/shakespeare', methods=['POST','GET'])
def shakespeare( ):
  db = utils.db_connect()
  cur = db.cursor()
  
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
  return render_template('shakespeare.html', verb1 = verb1, noun1 = noun1, adjective1 = adjective1)




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

  query = "SELECT fi.insult FROM full_insults AS fi INNER JOIN shakespeare_adjectives AS sa ON fi.foreign_key = sn.id AND sa.id = " + str(target)
  cur.execute(query)
  fullInsult = cur.fetchall()
  
  
  #/**************************/
  
  return render_template('responses.html', verb1 = verb1, noun1 = noun1, adjective1 = adjective1, verb = verb, noun = noun, adjective = adjective, fullInsult = fullInsult)




@app.route('/register', methods=['GET', 'POST'])
def register():
    page = 'register'
    global currentUser
    global globalLogin
    db = complimentutil.db_connect()
    cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
    # if user typed in a post ...
    if request.method == 'POST':
      print "Thank you for registering with Insult Generator!"
      username = MySQLdb.escape_string(request.form['username'])
      currentUser = username
      password = MySQLdb.escape_string(request.form['password'])
      
      query1 = "INSERT INTO users (username) VALUES ('%s')" % username
      print query1
      cur.execute(query1)
      
      query2 = "INSERT INTO user_passwords (password) VALUES (SHA2('%s', 0))" % password
      print query2
      cur.execute(query2)
      
      session['username'] = currentUser         
      query3 = "SELECT * from users WHERE username = '%s'" % session['username']
      print query3
      cur.execute(query3)          
      globalLogin=True
      return redirect(url_for('index'))
      
    return render_template('register.html', page=page, globalLogin=globalLogin)
  

@app.route('/login', methods=['GET', 'POST'])
def login():
    page = 'Login'  
  
    global currentUser
    global globalLogin
    db = complimentutil.db_connect()
    cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
    # if user typed in a post ...
    if request.method == 'POST':
      print "Welcome!"
      username = MySQLdb.escape_string(request.form['username'])
      currentUser = username
      
      pw = MySQLdb.escape_string(request.form['password'])
      query = "SELECT u.username, up.password FROM users u INNER JOIN user_passwords up ON u.id = up.id WHERE u.username = '%s' AND up.password = SHA2('%s', 0)" % (username, pw)
      print query
      cur.execute(query)
           
      if cur.fetchone():
         session['username'] = currentUser                  
         globalLogin=True
         return redirect(url_for('index'))
      else:
        print "woops, login error! please try again"
    return render_template('login.html', page=page, globalLogin=globalLogin)
  
  
@app.route('/logout', methods=['GET', 'POST'])
def logout():
    global globalLogin
    session.pop('username', None)
    globalLogin=False
    return redirect(url_for('index'))

if __name__ == '__main__':
  app.run(host='0.0.0.0',port=3000)
