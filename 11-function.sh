#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "ERROR: you need root access privilage to execute the script"
    exit 1
fi   


VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "ERROR: installing $2 is FAILED"
    exit 1
else
    echo "installing $2 is SUCCESS"
}

dnf install mysqqql -y 
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install python3 -y
VALIDATE $? "python3"        

