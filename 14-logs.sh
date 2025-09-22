#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_Folder="/var/log/shell-script"
script_name=$( echo $0 | cut -d "." -f1 )
Log_File="$Log_Folder/$script_name.log"
mkdir -p $Log_Folder
echo "Script execution start time: $(date)"



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

dnf list installed mysql &>>$Log_File
if [ $? -ne 0 ]; then
    echo "installing the mysql"    
dnf install mysql -y &>>Log_File
VALIDATE $? "mysql"
else
    echo -e " $Y skipping $N the mysql installation"
fi    

dnf list installed nginx &>>$Log_File
if [ $? -ne 0 ]; then
dnf install nginx -y &>>$Log_File
VALIDATE $? "nginx"
else 
    echo -e "$Y skipping $N the nginx installation"
fi    

dnf list installed python3 &>>$Log_File
if [ $? -ne 0 ]; then
dnf install python3 -y &>>$Log_File
VALIDATE $? "python3" 
else 
    echo -e "$Y skipping $N the python3 installation"
fi           
echo "Script execution end time: $(date)"
