#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_Folder="/var/log/shell-script"
script_name=$( echo $0 | cut -d "." -f1 )
Log_File="$Log_Folder/$script_name.log"
mkdir -p $Log_Folder
echo "Script execution start time: $(date)" | tee -a $Log_File



id=$(id -u)

if [ $id -ne 0 ]; then
    echo "ERROR: you need root access privilage to execute the script" | tee -a $Log_File
    exit 1
fi   


VALIDATE () {
if [ $1 -ne 0 ]; then
    echo -e "ERROR: installing $2 is $R FAILED $N" | tee -a $Log_File
    exit 1
else
    echo -e "installing $2 is $G SUCCESS $N" | tee -a $Log_File
fi    
}

for package in {$@}
do
dnf list installed $package &>>$Log_File
if [ $? -ne 0 ]; then
    echo "installing the $package"    
dnf install $package -y &>>Log_File
VALIDATE $? $package
else
    echo -e " $Y skipping $N the $package` installation" | tee -a $Log_File
fi  
done       
echo "Script execution end time: $(date)"