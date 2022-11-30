from flask import Flask, render_template, redirect, request, flash
from flask_mysqldb import MySQL, MySQLdb
from werkzeug.utils import secure_filename
import os
#import magic
import urllib.request
from datetime import datetime

app = Flask(__name__)

app.secret_key = "webApp"

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'testingdb'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)

UPLOAD_FOLDER = 'static/uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])


def allowed_file(filename):
 return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/', methods=["POST", "GET"])
def index():
    return render_template('index.html')


@app.route("/upload", methods=["POST", "GET"])
def upload():
    cursor = mysql.connection.cursor()
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    now = datetime.now()
    if request.method == 'POST':
        files = request.files.getlist('files[]')
        # print(files)
        for file in files:
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                cur.execute(
                    "INSERT INTO images (file_name, uploaded_on) VALUES (%s, %s)", [filename, now])
                mysql.connection.commit()
            print(file)
        cur.close()
        flash('File(s) successfully uploaded')
    return redirect('/')


if __name__ == "__main__":
    app.run(debug=True)
