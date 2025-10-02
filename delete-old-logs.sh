#!/bin/bash

# - I have given you a folder so you need to delete the log files which are 14 days old
# step1: check whether folder or directory exists or not 
# step2: if directory exists then find the files with *.log extension and also which are 14 days old
# step3: after finding the files delete the files by LOGGING

N="\e[0m"
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
source_dir=/home/ec2-user/bharath
log_folder=/var/log/shell-script
script_name=$(echo $0 | cut -d "." -f1)
file_name=$log_folder/$script_name.log
logging() {
mkdir -p $log_folder
    start_time=$(date +%s)
    echo "script execution started at time $(date)" | tee -a $log_file
}
 id=$(id -u)
 if [ $id -ne 0 ]; then
    echo -e "$R Please run this script with root user privilage $N"
    exit 1
fi
logging 
if [ ! -d "$source_dir" ]; then
    echo "ERROR: Source directory doesnt exist"
    exit 1
else
    echo "source directory exists"
fi

files=$(find "$source_dir" -name "*.log" -type f -mtime +14)

while IFS= read -r file
do
    echo "deleting the file ${file}"
    rm -rf "${file}"
    echo "deleted the file ${file}"
done <<< ${files}

end_time=$(date +%s)
total_time=$(($end_time-$start_time))
echo "Total time taken to execute the script is $total_time seconds"






