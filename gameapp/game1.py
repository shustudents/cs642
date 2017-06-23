#!/usr/bin/python
from random 
import randint
import sys
import json
import mysql.connector

def getConnection():
        conn = mysql.connector.connect(option_files='/etc/mysql/gamedbconnect.cnf')
        return conn;

def insertRecord(result,user):

        conn = getConnection()
        cur = conn.cursor()
        query = "insert into records (username,result,date) values (%s,%s,sysdate())"
        data = (user, result)
        cur.execute(query,data)
        conn.commit()
        cur.close()
        conn.close()
        return;

def fetchCounts(user):
        tie=0;
        lose=0;
        win=0;
        conn = getConnection()
        cur = conn.cursor()
        query = """select result, count(result) count from records where username= %s group by result"""
        data = (user,)
        cur.execute(query,data)
        for (result, count) in cur:
                if result == 'Tie':
                        tie=count
                if result == 'win':
                        win=count
                if result == 'lose':
                        lose=count
        cur.close()
        conn.close()
        return {'tie':tie, 'lose':lose ,'win':win };

print "Content-Type: text/plain;charset=utf-8"
print


POST={}
args=sys.stdin.read().split('&')

for arg in args: 
    t=arg.split('=')
    if len(t)>1: k, v=arg.split('='); POST[k]=v

#POST['user']='jignesh'
#POST['input']='Rock'
user=POST.get('user')
input=POST.get('input')


#create a list of play options
t = ["Rock", "Paper", "Scissors"]

#assign a random play to the computer
computer = t[randint(0,2)]

#set player to False
player = False

#set result to empty string
result = "";

#set message to empty string
message = "";


while player == False:
#set player to True
    player = input
    if player == computer:        
	result = "Tie"
	message = "Tie!"
    elif player == "Rock":
        if computer == "Paper":
		result = "lose"
    		message = "'You lose!','"+ computer+ "','covers','" + player   +"'"        
        else:            
		result = "win"
    		message = "'You win!','"+ player+ "','smashes','" + computer +"'"
    elif player == "Paper":
        if computer == "Scissors":           
		result = "lose"
    		message = "'You lose!','"+ computer+ "','cut','" + player   +"'"
        else:
		result = "win"
    		message = "'You win!','"+ player+ "','covers','" + computer +"'"          
    elif player == "Scissors":
        if computer == "Rock":
		result = "lose"
    		message = "'You lose...','"+ computer+ "','smashesi','" + player +"'"            
        else:
		result = "win"
    		message = "'You win!','"+ player+ "','cut','" + computer +"'"           
    else:
       	print("That's not a valid play. Check your spelling!")
    	#player was set to True, but we want it to be False so the loop continues
    	player = False
    	computer = t[randint(0,2)]
insertRecord(result,user)
counts=fetchCounts(user)
#counts={'tie':10, 'lose':20 ,'win':30 }
finalResult=json.dumps({'message': message,'counts': counts })
print(finalResult)
#how to push
# curl -v  -X PUT -d '"Paper"' http://107.23.8.230//cgi-bin/test2.py

