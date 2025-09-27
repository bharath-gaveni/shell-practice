#!/bin/bash
N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"

id=$(id -u)
if [ $id -ne 0 ]; then
    echo " $R please execute this script as root user $N"
    exit 1
fi

log_folder=/var/log/shell-script
script_name=$(echo $0 | cut -d "." -f1)
log_file=$log_folder/$script_name.log
echo "script execution started at $(date)" 
mkdir -p $log_folder

check() {
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 is $R failed $N" | tee -a $log_file
        exit 1
    else
        echo -e "installing $2 is $G success $N" | tee -a $log_file
    fi              
}

for package in $*
do
dnf list installed $package &>>$log_file
if [ $? -ne 0 ]; then
dnf install $package -y &>>$log_file
check $? "$package"
else
    echo -e "$package is already installed so $Y skipping... $N" | tee -a $log_file
fi
done







