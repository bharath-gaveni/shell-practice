#!/bin/bash

# - we need to zip the files .log files which are 14 days old from source to destination path
# sudo <sh backup.sh> <source_dir> <destination_dir> <days [optional,default is 14]>
# here source and destination dir are mandatory
# <backup.sh is file name>

# step1: check the number arguments passes to the script is 2 or more, if less 2 we need to stop the execution
# step2: check if arguments passed to the script is more than 2 then --> check source and destination_dir are present or not
# step3: if source and destination dir are present find the files .log files which are 14 days older
# step4: if files found zip them to destination directory
# step5: check if zip file is successfully saved in destination directory
# step6: if zip file saved or present in destination directory then we can delete the .log orginal files from the source directory


N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
source_dir=$1
destination_dir=$2
days=${3:-14}

id=$(id -u)
if [ $id -ne 0 ]; then
    echo -e "$R please execute this script with root access privilage $N"
    exit 1
fi

log_folder=/var/log/shell-script
script_name=$(echo $0 | cut -d "." -f1)
log_file=$log_folder/$script_name.log
mkdir -p $log_folder
echo "script execution started at time $(date)"
start_time=$(date +%s)

if [ $# -lt 2 ]; then
    echo -e "$R USAGE: sudo sh logs-backup.sh <source_dir> <destination_dir> <days [optional, 14 days]> $N"
    exit 1
fi


if [ ! -d "$source_dir" ]; then
    echo "Source directory not exist"
    exit 1
 fi


 if [ ! -d "$destination_dir" ]; then
    echo "Destination directory not exist"
    exit 1
fi


files=$(find "$source_dir" -name "*.log" -type file -mtime +14)


if [ -z "$files" ]; then
    echo "NO files found"
    exit 0
else
    echo "files found"
    time_stamp=$(date +%F-%H-%M)
    Zip_file_name=$destination_dir/backup-log/$time_stamp.zip
    echo "zip file name is : $Zip_file_name"
    find "$source_dir" -name "*.log" -type file -mtime +14 | zip -@ -j $Zip_file_name
fi    


if [ ! -d "$Zip_file_name" ]; then
    echo -e " $R Zip file is failed to save in destination directory $N"
else
    echo -e "$G Zip file is succesfully saved in destination directory $N"
    while IFS= read -r filetodelete
    do
        echo "deleting the file $filetodelete"
        rm -rf "$filetodelete"
        echo "Deleted the file: $filetodelete"
    done <<< "$files"  
fi







