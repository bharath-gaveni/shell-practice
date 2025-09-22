#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "ERROR: you need root access privilage to execute the script"
    exit 1
fi   


VALIDATE () {
if [ $1 -ne 0 ]; then
    echo "ERROR: installing $2 is FAILED"
    exit 1
else
    echo "installing $2 is SUCCESS"
fi    
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "installing the mysql"    
dnf install mysql -y 
VALIDATE $? "mysql"
else
    echo "skipping the mysql installation"
fi    

dnf list installed nginx
if [ $? -ne 0 ]; then
dnf install nginx -y
VALIDATE $? "nginx"
else
    echo "skipping the nginx installation"
fi    

dnf list installed python3
if [ $? -ne 0 ]; then
dnf install python3 -y
VALIDATE $? "python3" 
else 
    echo "skipping the python3 installation"
fi           

