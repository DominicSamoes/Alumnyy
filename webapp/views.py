from flask import Blueprint, render_template, request
from flask_login import login_required, current_user
from .models import user as User
from  sqlalchemy.sql.expression import func

views = Blueprint('views', __name__)

@views.route('/')
def index():
    """Display six random alumni and schools"""
    alumni = User.query.order_by(func.rand()).limit(4)
    schools = User.query.order_by(func.rand()).limit(8)
    return render_template("index.html", alumni=alumni, schools=schools)

@views.route('/home')
@login_required 
def home():
    """Display six random alumni from alma mater"""
    alumni = User.query.filter_by().order_by(func.rand())
    return render_template("home.html", user=current_user, alumni=alumni)

@views.route('/about')
def about():
    return render_template("about.html")

@views.route('/profile', methods=['GET'])
@login_required 
def profile():
    """Returns profile alumnus of interest"""
    id = request.args.get('id')
    alumnus = User.query
    return render_template("profile.html", user=current_user, alumnus=alumnus, id=id)
