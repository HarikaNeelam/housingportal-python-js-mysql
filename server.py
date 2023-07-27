from flask import Flask, render_template, request, url_for, flash, redirect
from flask_mysqldb import MySQL
from random import randint
import traceback,os

app = Flask(__name__)
app.secret_key = 'my unobvious secret key'

mysql = MySQL()

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'housing'
app.config['MYSQL_HOST'] = 'localhost'
mysql = MySQL(app)

@app.route('/',methods = ['GET','POST'])
def home():
    if request.method == 'POST':
        id = request.form['id']
        password = request.form['password']
        cur = mysql.connection.cursor()
        cur.execute('''SELECT * FROM admin WHERE (admin_id, password) = (%s,%s)''',(id,password))
        n = cur.fetchall()
        if len(n)!=0:
            print (n)
            return render_template('admin-logged.html')
        else:
            print (n)
            return render_template('index.html')
    return render_template('index.html')

@app.route('/home',methods = ['GET','POST'])
def homepage():
    return render_template('home.html')
@app.route('/apartment', methods=['GET', 'POST'])
def apartment():
    data = []
    cur = mysql.connection.cursor()
    cur.execute('''select apt_id, `doorno`, `price`, `status`, `img`, bhk, bathroom, size, name, phone 
                   from apartment a, apt_detail a1, person p 
                   where a.apt_detail_code=a1.apt_detail_code and p.per_id = a.owner_per_id''')
    rows = cur.fetchall()
    print(rows)
    if not rows:
        return render_template('apartmentnull.html')
    else:
        for row in rows:
            row = list(row)
            if row[3] == "n":
                row[3] = "none"
                row.append("bg-light text-secondary")
            else:
                row[3] = "auto"
                row.append("btn-primary")
            data.append(row)
        return render_template('apartment.html', data=data)
    
@app.route('/society', methods=['GET', 'POST'])
def society():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM society''')
    data = cur.fetchall()
    print(data)
    cur.execute('''SELECT * FROM facility''')
    fac_data = cur.fetchall()

    return render_template('society.html', data=data, fac_data=fac_data)


@app.route('/specificapt/<build>',methods =['GET','POST'])
def specificapt(build):
    data = []
    sid = build;
    cur = mysql.connection.cursor();

   #have to fix items index in html

    cur.execute('''select apt_id, doorno, price, status, a.img, bhk, bathroom, size, p.name, phone, s.name 
        from apartment a, apt_detail a1, person p, society s 
        where a.apt_detail_code=a1.apt_detail_code and p.per_id = a.owner_per_id and s.sid=a.sid and a.sid = %s''',(sid))
    rows = cur.fetchall()
    cur.execute('''SELECT facility, image from facility where sid=%s''', (sid,))
    fac_data = cur.fetchall()
    #print fac_data
    for row in rows:
        row = list(row)
        if(row[3] == "n"):
            row[3] = "none"
            row.append("bg-light text-secondary")
        else:
            row[3] = "auto"
            row.append("btn-primary")
        data.append(row)
    return render_template('specific-apt.html',data = data, fac_data=fac_data)

@app.route('/addapt', methods=['GET', 'POST'])
def addapt():
    try:
        if request.method == 'POST':
            apt_id = request.form['apt_id']
            sid = request.form['sid']  # Changed from 'bid' to 'sid'
            apt_detail_code = request.form['apt_detail_code']
            door_no = request.form['door_no']
            owner = request.form['owner_id']
            price = request.form['price']
            image = request.files['image']

            if image:
                image.save(os.path.join('static/apartments', image.filename))

            if (owner == '' or owner == 'null'):
                cur = mysql.connection.cursor()
                cur.execute('''INSERT INTO apartment(apt_id, sid, apt_detail_code, doorno, price, img) 
                            VALUES(%s,%s,%s,%s,%s,%s)''', (apt_id, sid, apt_detail_code, door_no, price, image.filename))
                mysql.connection.commit()
            else:
                cur = mysql.connection.cursor()
                cur.execute('''INSERT INTO apartment(apt_id, sid, apt_detail_code, doorno, owner_per_id, price, img, status) 
                            VALUES(%s,%s,%s,%s,%s,%s,%s,%s)''',
                            (apt_id, sid, apt_detail_code, door_no, owner, price, image.filename, 'n'))
                mysql.connection.commit()
    except:
        print('bad')
        print(traceback.print_exc())

    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM apartment''')
    data = cur.fetchall()

    # Fetch data for the "society" table to populate the dropdown list
    cur.execute('''SELECT sid, name FROM society''')
    society_data = cur.fetchall()
    # Fetch data for the "person" table to populate the dropdown list
    cur.execute('''SELECT per_id, name FROM person''')
    owner_data = cur.fetchall()
    # Fetch data for the "apt_detail" table to populate the dropdown list
    cur.execute('''SELECT apt_detail_code, description FROM apt_detail''')
    aptdetail_data = cur.fetchall()

    return render_template('admin-apartment-insert.html', data=data, society_data=society_data, owner_data=owner_data, aptdetail_data=aptdetail_data)


@app.route('/addadmin', methods = ['GET','POST'])
def addadmin():
     try:
         if request.method == 'POST':
             admin_id = request.form['admin_id']
             password = request.form['password']
             cur = mysql.connection.cursor()
             cur.execute('''INSERT INTO admin(admin_id,password) VALUES (%s,%s)''',(admin_id,password))
             mysql.connection.commit()
     except:
         print ('bad')
     cur = mysql.connection.cursor()
     cur.execute('''SELECT * FROM admin''')
     data = cur.fetchall()
     return render_template('admin-add.html', data = data)

@app.route('/deladmin', methods = ['GET','POST'])
def deladmin():
    try:
        if request.method == 'POST':
            admin_id = request.form['admin_id']
            password = request.form['password']
            #print admin_id,password
            cur = mysql.connection.cursor()
            cur.execute('''DELETE FROM admin where admin_id = %s and password = %s;''',(admin_id,password))
            mysql.connection.commit()
    except:
        #print admin_id,password
        print ('bad')
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM admin''')
    data = cur.fetchall()
    return render_template('admin-add.html', data = data)

#Facilites
@app.route('/addfacilites', methods = ['GET','POST'])
def addfacilites():
    try:
        if request.method == 'POST':
            sid = request.form['bid']
            fac = request.form['fac']
            #print sid, fac
            cur = mysql.connection.cursor()
            cur.execute('''INSERT into facility(sid,facility) VALUES (%s,%s)''',(sid,fac))
            mysql.connection.commit()
    except:
        print ('bad')
        #print sid
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM facility''')
    data = cur.fetchall()
    return render_template('facilities-admin.html', data = data)


@app.route('/addsociety', methods=['POST','GET'])
def addsociety():
    if request.method == 'POST':
        sid = request.form['bid']
        name = request.form['name']
        address = request.form['address']
        mgr = request.form['mgr_per_id']
        image = request.files['image']
        if image:
          image.save(os.path.join('static/societies', image.filename))

        cur = mysql.connection.cursor()
        try:
            cur.execute('''INSERT into society(sid,name,address,mgr_per_id,img) 
            	VALUES (%s,%s,%s,%s,%s)''',(sid,name,address,mgr,image.filename))
            mysql.connection.commit()
        except:
            print ('bad')
            print (sid)
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM society''')
    data = cur.fetchall()
    return render_template('admin-society-insert.html', data = data)

@app.route('/buildingupdate',methods = ['GET','POST'])
def buildingupdate():
        try:
            if request.method == 'POST':
                sid = request.form['bid']
                mgr = request.form['mgr_per_id']
                cur = mysql.connection.cursor()
                cur.execute('''UPDATE society SET mgr_per_id = %s where sid = %s''',(mgr,sid))
                mysql.connection.commit()
        except:
            print ('bad')
            #print sid,mgr
        cur = mysql.connection.cursor()
        cur.execute('''SELECT * FROM society''')
        data = cur.fetchall()
        return render_template('building-update.html', data = data)

@app.route('/addperson', methods=['POST','GET'])
def addperson():
    if request.method == 'POST':
        per_id = request.form['per_id']
        name = request.form['name']
        phone = request.form['phone']
        cur = mysql.connection.cursor()
        try:
            cur.execute('''INSERT into person(per_id,name,phone) VALUES (%s,%s,%s)''',(per_id,name,phone))
            mysql.connection.commit()
        except:
            print ('bad')
            #print per_id
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM person''')
    data = cur.fetchall()
    return render_template('add-person.html', data = data)

@app.route('/login/<build>', methods = ['GET', 'POST'])
# we can make another function for login which returns true if user exist
# in the db.
def user_login(build):
    apt_id = str(build)
    cur = mysql.connection.cursor()
    cur.execute('''Select status,sid from apartment where apt_id = %s''',(apt_id,))
    stat = cur.fetchall()
    sid = stat[0][1]
    if(stat[0][0] == 'n'):
        flash('The chosen apartment is unavailable, please book another apartment.',(apt_id,))
        return redirect(url_for('home'))
    else:
        if request.method == 'POST':
            user_email = request.form['user_id']
            user_password = request.form['user_pwd']
            cur = mysql.connection.cursor()
            cur.execute('''SELECT * FROM user WHERE (email, password) = (%s,%s)''',(user_email,user_password))
            n = cur.fetchall()
            if len(n)!=0:
                user_id = str(n[0][0])
                try:
                    cur = mysql.connection.cursor()
                    #cur.execute('''UPDATE apt_book SET uid = %s, book_date = CURDATE() WHERE apt_id = %s''',(user_id,apt_id,))
                    cur.execute('''INSERT INTO apt_book(apt_id,sid,uid,book_date) 
                        VALUES (%s,%s,%s,NOW())''',(apt_id,sid,user_id,))
                    mysql.connection.commit()
                    print (traceback.print_exc())
                    flash('Your Apartment has been booked successfully.')
                    return redirect(url_for('home'))
                except:
                     print (traceback.print_exc())
            else:
                 flash('Invalid username/password.Try again or Sign up.')
    return render_template('login.html')

@app.route('/signup', methods = ['GET', 'POST'])
def signup():
    is_id_uniq = False
    if request.method == 'POST':
        user_name = request.form['user_name']
        #uid = request.form['uid']
        user_id = request.form['user_id']
        user_password = request.form['user_pwd']
        cur = mysql.connection.cursor()
        try:
            # uid is auto increment
            cur.execute('''INSERT INTO user (name, email, password) 
                VALUES (%s, %s, %s)''', (user_name, user_id, user_password))
            n = cur.fetchall()
            mysql.connection.commit()
            flash('User added! Sign in to book your apartment.')
            return redirect(url_for('home'))
        except Exception as e:
            print (traceback.print_exc())
            flash("E-mail id already exist")
    return render_template('signup.html')

@app.route('/adddetails', methods = ['GET','POST'])
def adddetails():
    if request.method == 'POST':
        adc = request.form['apt_detail_code']
        bhk = request.form['bhk']
        bathroom = request.form['bathroom']
        size = request.form['size']
        desc = request.form['desc']
        try:
            cur = mysql.connection.cursor()
            cur.execute('''INSERT INTO apt_detail(apt_detail_code,bhk,bathroom,size,description) 
                VALUES (%s,%s,%s,%s,%s)''',(adc,bhk,bathroom,size,desc,))
            mysql.connection.commit()
        except:
            print (traceback.print_exc())
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM apt_detail''')
    data = cur.fetchall()
    return render_template('add-details.html',data = data)

@app.route('/transcript')
def transcript():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM apt_book''')
    data = cur.fetchall()
    #print data
    return render_template('transcript.html', data = data)

@app.route('/login',methods = ['GET','POST'])
def login():
    return render_template('login.html')  
'''
@app.route('/authenticate',methods = ['GET','POST'])
def authenticate():
    if request.method == 'POST':
        apt_id = request.form['apt']
        uid = request.form['uid']
        name = request.form['name']
        try:
            cur = mysql.connection.cursor()
            # need to create a new per_id(cuz it might clash with already existing ids)
            # check if the user already exist in person table
            # if doesnt insert new values else dont insert
            # using auto increment for per_id
            cur.execute("INSERT INTO person(per_id,name) VALUES (%s,%s)",(uid,name,))
            mysql.connection.commit()
            cur.execute("UPDATE apartment SET owner_per_id = %s, status = 'n' WHERE apt_id = %s",(uid,apt_id))
            mysql.connection.commit()
        except:
            print traceback.print_exc()
    cur = mysql.connection.cursor()
    cur.execute("SELECT apt_id,a.uid,u.uid,u.name FROM apt_book a,user u GROUP BY apt_id,a.uid,u.name HAVING MAX(book_date) and u.uid = a.uid")
    data = cur.fetchall()
    return render_template('approve.html',data = data)
'''

@app.route('/updapt',methods = ['GET','POST'])
def updapt():
        try:
            if request.method == 'POST':
                apt_id = request.form['apt_id']
                status = request.form['status']
                sid = request.form['sid']
                owner_id = request.form['owner_id']
                cur = mysql.connection.cursor()
                cur.execute('''UPDATE apartment SET sid=%s, owner_per_id=%s, status = %s 
                	where apt_id = %s''',(sid, owner_id, status, apt_id))
                mysql.connection.commit() 
        except:
            print ('bad')
            print (traceback.print_exc())
            #print sid,mgr
        cur = mysql.connection.cursor()
        cur.execute('''SELECT apt_id,sid,owner_per_id,status FROM apartment''')
        data = cur.fetchall()
        return render_template('update-admin-apartment.html', data = data)
    
if __name__ == '__main__':
    app.run(debug = True)
