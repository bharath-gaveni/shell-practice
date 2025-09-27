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

dnf install mysql -y
Validate $? "mysql"

dnf install python3
Validate $? "python3"
     




