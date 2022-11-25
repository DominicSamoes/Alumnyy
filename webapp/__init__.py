from flask import Flask
from flask_sqlalchemy import SQLAlchemy 
from flask_login import LoginManager

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'SE Pot!!!**%%##WooJ'
    app.config['SQLALCHEMY_DATABASE_URI'] =  'mysql://flaskycon:^Dev3l0pmEnt!!@localhost/pythonlogin'
    db.init_app(app)

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')

    from .models import user

    create_database(app)

    # Manage logins
    login_manager = LoginManager()
    login_manager.login_view = 'auth.login'
    login_manager.init_app(app)

    @login_manager.user_loader
    def load_user(id):
        return user.query.get(int(id)) 

    return app

def create_database(app):
    with app.app_context():
        db.create_all()
        print ("Database created! ") 