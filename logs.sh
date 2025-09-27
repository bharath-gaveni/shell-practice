#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m" 

id=$(id -u)

logs_folder=/var/log/shell-script
script_name=$($0 | cut -d "." -f1)
log_file=$logs_folder/$script_name.log

mkdir -p $logs_folder

echo "script execution start time: $date"

if [ $id -ne 0 ]; then
    echo -e "$R Please run this script as root user $N" | tee -a $log_file
    exit 1
fi

Validate() {
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is $R failed $N" | tee -a $log_file
        exit 1
    else
        echo -e "installing $2 is $G success $N" | tee -a $log_file
    fi       
}

dnf list installed nginx &>>$log_file
if [ $? -ne 0 ]; then
dnf install nginx -y &>>$log_file
Validate $? "nginx"
else
    echo -e "nginx is already installed so $Y skipping $N" | tee -a $log_file
fi

dnf list installed mysql &>>$log_file
if [ $? -ne 0 ]; then
dnf install mysql -y &>>$log_file
Validate $? "mysql"
else
    echo -e "mysql is already installed so $Y skipping $N" | tee -a $log_file
fi

dnf list installed maven &>>$log_file
if [ $? -ne 0 ]; then
dnf install maven -y &>>$log_file
Validate $? "maven"
else
    echo -e "maven is already installed so $Y skipping $N" | tee -a $log_file
fi


     




