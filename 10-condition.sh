#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "ERROR: you need root access privilage to execute the script"
    exit 1
fi    
dnf install mysql -y 
if [ $? -ne 0 ]; then
    echo "ERROR: installing mysql is FAILED"
else 
    echo "installing mysql is success"
fi