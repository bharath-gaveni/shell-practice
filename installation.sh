#!/bin/bash

# id -u --> is 0 then it is root user othan than 0 it is not a root user
# $? --> previous executed command exit status if $?=0 command success if $?=1 to 127 its command failure

if [ id -u -ne 0 ]; then
    echo "PLease run this script with root access privilage"
fi

# in shell-script if some command throws error it will proceeds further exit1=failure, exit0=success.
dnf install mysql -y 
if [ $? -ne 0 ]; then 
    echo "installing mysql is Failed"
    exit 1
else
    echo "installing mysql is Success"
fi

dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "installing nginx is Failed"
    exit 1
else
    echo "installing nginx is Success"
fi

dnf install python3 -y
if [ $? -ne 0 ]; then
    echo "installing python is Failed"
else
    echo "installing python is Success"
fi        
