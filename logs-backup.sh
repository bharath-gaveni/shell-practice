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
check_root
log_folder=/var/log/shell-script
script_name=$(echo $0 | cut -d "." -f1)
log_file=$log_folder/$script_name.log
mkdir -p $log_folder
    echo "script execution started at time $(date)"
    start_time=$(date +%s)

check_root() {
    id=$(id -u)
    if [ $id -ne 0 ]; then
        echo -e "$R please execute this script with root access privilage $N"
        exit 1
    fi
}

