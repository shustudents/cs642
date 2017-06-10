#!/usr/bin/python
from random import randint
import mysql.connector


def insertRecord(result):

        conn = mysql.connector.connect(
                user='game',
                password='cs642',
                host='172.31.53.140',
                database='games')
        cur = conn.cursor()
        query = "insert into records (username,password,result,score,date) values ('jignesh','123456','"+result+"i',1,sysdate())"
        cur.execute(query)
        conn.commit()
        cur.close()
        conn.close()
        return;



print "Content-Type: text/html"
print

#create a list of play options
t = ["Rock", "Paper", "Scissors"]

#assign a random play to the computer
computer = t[randint(0,2)]

#set player to False
player = False

while player == False:
#set player to True
    player = input("Rock, Paper, Scissors?")
    if player == computer:
        print("Tie!")
	insertRecord("Tie")
    elif player == "Rock":
        if computer == "Paper":
            print("You lose!", computer, "covers", player)
            insertRecord("lose")
        else:
            print("You win!", player, "smashes", computer)
            insertRecord("win")
    elif player == "Paper":
        if computer == "Scissors":
            print("You lose!", computer, "cut", player)
        else:
            print("You win!", player, "covers", computer)
            insertRecord("win")
    elif player == "Scissors":
        if computer == "Rock":
            print("You lose...", computer, "smashes", player)
            insertRecord("lose")
        else:
            print("You win!", player, "cut", computer)
            insertRecord("win")
    else:
        print("That's not a valid play. Check your spelling!")
    #player was set to True, but we want it to be False so the loop continues
    player = False
    computer = t[randint(0,2)]

#how to push
# curl -v  -X PUT -d '"Paper"' http://107.23.8.230//cgi-bin/test2.py
