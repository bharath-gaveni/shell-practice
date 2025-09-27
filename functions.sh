#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "Please run this script with root user privilage"
fi


Validate() {
    if [ $1 -ne 0 ]; then
        echo "installing $2 is failed"
        exit 1
    else
        echo "installing $2 is success" 
    fi       
}

dnf install mysql -y 
validate $? mysql

dnf install nginx -y 
validate $? nginx

dnf install python3 -y
validate $? python




    