#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m" 

id=$(id -u)
if [ $id -ne 0 ]; then
    echo "please execute this script as root user"
    exit 1

 log_folder=/var/log/shell-script
 script_name=$(echo $0 | cut -d "." -f1)
 log_file=$log_folder/$script_name.log

 mkdir -p $log_folder

 echo "script exceution started at time $(date)" | tee -a $log_file

 Validate() {
    if [ $1 -ne 0 ]; then
        echo "installing $2 is failed" | tee -a $log_file
        exit 1
    else
        echo "installing $2 is success" | tee -a $log_file
    fi        
 }


for package in $@
do
dnf list installed $package &>>$log_file
if [ $? -ne 0 ]; then
dnf install $package -y &>>$log_file
Validate $? "$package"
else
    echo "$package is already installed so skipping..." | tee -a $log_file
fi
done




