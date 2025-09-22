#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]; then
    echo "ERROR: you need root access privilage to execute the script"
dnf install mysqlserver -y 
if [ $? -ne 0 ]; then
    echo "ERROR: installing mysql is FAILED"
else 
    echo "installing mysql is success"
fi