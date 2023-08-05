from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# User chat account
class User(db.Model):
    uid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(30), unique=True, nullable=False)  # Change username to email
    password = db.Column(db.String(30), nullable=False)

    def __init__(self, name, email, password):
        self.name = name
        self.email = email
        self.password = password

    def __repr__(self):
        return '<User %r>' % self.email

# Rest of your models.py code remains the same.
# Chat room model
class chatRoom(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    roomName = db.Column(db.String, unique=True)
    userCreated = db.Column(db.Text, nullable=False)

    def __init__(self, roomName, userCreated):
        self.roomName = roomName
        self.userCreated = userCreated

    def __repr__(self):
        return '<Chatroom: {}>'.format(self.roomName)

# Message log model
class messageLog(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    userName = db.Column(db.String, nullable=False)
    userSent = db.Column(db.String, nullable=False)
    roomName = db.Column(db.String, nullable=False)
    message = db.Column(db.Text, nullable=False)

    def __init__(self, userName, userSent,roomName, message):
        self.userName = userName
        self.userSent = userSent
        self.roomName = roomName
        self.message = message

    def __repr__(self):
        return '<Message: {}>'.format(self.message)