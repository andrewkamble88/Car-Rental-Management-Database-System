from flask import Flask, render_template,redirect
import MySQLdb
from flask import request

app = Flask('__name__')

conn = MySQLdb.connect(host='localhost',user='mayur',passwd = 'mayur2219981092',port = 8090,db="user")
cursor = conn.cursor()

@app.route('/')

def signin():
	print("entered")
	return render_template('index.html')
	
	
@app.route('/echo',methods=['POST'])

def sign():
	print("entered")
	Username_to_string = ""
	Username = request.form['Username']
	Password = request.form['Password']
	cursor.execute("""SELECT username FROM login """)
	actual_usernames = cursor.fetchall()
	Username_to_string = Username
	print(actual_usernames)
	"""for user in actual_usernames:
		string = user
		print(string)
	#	n = n + 1"""
	user_present = string in actual_usernames
	#	print("User is present")
	#	user_present = True
	#print("MAY:",may)
	if user_present == True:
		print("User is present")
		
		
	#query = "SELECT password FROM login WHERE username =%s"
	cursor.execute("""SELECT password FROM login WHERE username =%s""",[Username])
	actual_password = cursor.fetchone()
	#print("USERNAME : ",Username,"PASSWORD",Password)
	print(Username)
	print(Password)
	#url_redirect('/')
	#print(actual_password[1])
	if actual_password[0] == Password:
		print("TRUE")
	else:
		print("FALSE")
if __name__ == "__main__":
	app.run(debug = True)
