#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "ERROR: you need root access privilage to execute the script"
    exit 1
fi   


dnf install mysql11 -y 
if [ $? -ne 0 ]; then
    echo "ERROR: installing mysql is FAILED"
    exit 1
else 
    echo "installing mysql is success"
fi

dnf install nginx -y
if [ $? ne 0 ]; then
    echo "ERROR: installing nginx is FAILED"
else
    echo "installing nginx is SUCCESS"
fi

