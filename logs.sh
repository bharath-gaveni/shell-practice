#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m" 

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

Validate() {
    if [ $1 -ne 0 ]; then
        echo "installing $2 is failed"
        exit 1
    else
        echo "installing $2 is success"
    fi       
}

dnf list installed nginxx
if [ $? -ne 0 ]; then
dnf install nginx -y
Validate $? "nginx"
else
    echo "nginx is already installed so skipping"
fi

dnf list installed mysqlx
if [ $? -ne 0 ]; then
dnf install mysql -y
Validate $? "mysql"
else
    echo "mysql is already installed so skipping"
fi    

dnf list installed pythonx3
if [ $? -ne 0 ]; then
dnf install python3
Validate $? "python3"
else
    echo "python3 is already installed so skipping"
fi

     




