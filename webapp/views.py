from flask import Blueprint, render_template
from flask_login import login_required, current_user
from .models import user as User
from  sqlalchemy.sql.expression import func, select

views = Blueprint('views', __name__)

@views.route('/')
def index():
    """Display six random alumni"""
    alumni = User.query.order_by(func.rand()).limit(8)
    return render_template("index.html", alumni=alumni)

@views.route('/home')
@login_required 
def home():
    """Display six random alumni"""
    alumni = User.query.filter_by().order_by(func.rand()).limit(8)
    return render_template("home.html", user=current_user, alumni=alumni)

@views.route('/about')
def about():
    return render_template("about.html")
