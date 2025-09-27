#!/bin/bash

#color codes

N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"

id=$(id -u)

if [ $id -ne 0 ]; then
    echo -e "$R PLease run this script with root access $N"
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
    echo -e " mysql already installed so $Y Skipping $N"
fi    

dnf list installed nginx
if [$? -ne 0 ]; then
dnf install nginx -y
Validate $? "nginx"
else
    echo -e "nginx already installed so $Y Skipping $N"
fi    

 dnf list installed python3
 if [ $? -ne 0 ]; then
 dnf install python3 -y
 Validate $? "python3"
 else 
    echo -e "python3 alredy installed so $Y Skipping $N"
fi       
    
