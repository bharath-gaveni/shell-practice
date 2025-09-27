#!/bin/bash

N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"  

# id -u =0 for root user other than 0 it is normal user
# shell-script will proceed further if it has error so we need to stop manually using command exit 1 for failure exit 0=success
id=$(id -u)

 if [ $? -ne 0 ]; then
    echo -e "$R Please run this script with root access $N"
    exit 1
fi

Validate() {
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is $R failed $N"
        exit 1
    else
        echo -e "installing $2 is $G success $N"
    fi    
}


dnf list installed mysql
if [ $? -ne 0 ]; then
dnf install mysql -y
Validate $? "mysql"
else
    echo -e "mysql is already installed so $Y skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
dnf install nginx -y
Validate $? "nginx"
else 
    echo -e "nginx is already installed so $Y skipping $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
dnf install python3 -y
Validate $? "python3"
else
    echo -e "python3 is already installed so $Y skipping $N"
fi




    
