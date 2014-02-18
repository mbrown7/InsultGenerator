from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def mainIndex( ):
  return render_template('index.html')

@app.route('/index.html')
def homeIndex( ):
  return render_template('index.html')

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