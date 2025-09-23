#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "ERROR: you need root access privilage to execute the script"
    exit 1
fi   


VALIDATE () {
if [ $1 -ne 0 ]; then
    echo -e "ERROR: installing $2 is $R FAILED $N"
    exit 1
else
    echo -e "installing $2 is $G SUCCESS $N"
fi    
}

for package in ($@)
dnf list installed $1
if [ $? -ne 0 ]; then
    echo "installing the $1"    
dnf install $1 -y 
VALIDATE $? "$1"
else
    echo -e " $Y skipping $N the $1 installation"
fi    
