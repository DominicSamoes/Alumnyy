from flask import Blueprint, flash, redirect, render_template, request, jsonify, url_for
from flask_login import login_required, current_user
from .models import user as User, post as Post, connect as Connect, db
from  sqlalchemy.sql.expression import func
import json

views = Blueprint('views', __name__)

@views.route('/')
def index():
    """Display six random alumni and schools"""
    alumni = User.query.order_by(func.rand()).limit(4)
    schools = db.session.execute('SELECT DISTINCT school FROM user  ORDER BY RAND() LIMIT 8')
    return render_template("index.html", alumni=alumni, schools=schools)

@views.route('/home')
@login_required 
def home():
    """Displays home page with six random alumni from different alma maters"""
    alumni = User.query.filter_by().order_by(func.rand())
    return render_template("home.html", user=current_user, alumni=alumni)

@views.route('/about')
def about():
    """Returns about page"""
    return render_template("about.html")

@views.route('/profile', methods=['GET'])
@login_required 
def profile():
    """Returns profile of alumnus of interest"""
    id = request.args.get('id')
    alumnus = db.session.execute('SELECT * FROM user WHERE id = :val', {'val': id})
    return render_template("profile.html", user=current_user, alumnus=alumnus)

@views.route('/request_connection', methods=['GET'])
@login_required
def requestconnection():
    id = request.args.get('id')
    connreq = Connect(initid=current_user.id, recid=id)
    db.session.add(connreq)
    db.session.commit()
    flash('Connection request sent!', category='success')
    return redirect(url_for('views.connections'))

@views.route('/connectprofile', methods=['GET'])
@login_required 
def connectprofile():
    """Returns profile of alumnus connected with"""
    id = request.args.get('id')
    alumnus = User.query
    return render_template("connectionprofile.html", user=current_user, alumnus=alumnus, id=id)

@views.route('/connections')
@login_required
def connections():
    return render_template('connections.html')

@views.route('/posts')
@login_required 
def posts():
    """Returns posts by alma mater alumni"""
    posts = Post.query
    alumni = User.query
    return render_template("posts.html", user=current_user, posts=posts, alumni=alumni)

@views.route('/post', methods=['GET', 'POST'])
@login_required 
def post():
    """Writes posts to DB"""
    if request.method == 'POST':
        text = request.form.get('text')

        if len(text) < 10:
            flash('Post is too short!', category='error')
        elif len(text) > 10000:
            flash('Post is too long!', category='error')
        else:
            new_post = Post(text=text, userid=current_user.id)
            db.session.add(new_post)
            db.session.commit()
            flash('Post is added successfully!', category='success')

    return render_template("post.html", user=current_user)    

@views.route('/deletepost', methods=['POST'])
def delete_post():
    """Delete a post"""
    post = json.loads(request.text)
    postId = post['postId']
    post = Post.query.get(postId)
    if post:
        if post.userid == current_user.userid:
            db.session.delete(post)
            db.session.commit()
    
    return jsonify({})