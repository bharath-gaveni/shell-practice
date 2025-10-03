#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=2
message=""

while IFS= read -r linebyline 
do
    usage=$(echo $linebyline | awk '{print $6}' | cut -d "%" -f1)
    partion=$(echo $linebyline | awk '{print $7}')
    if [ $usage -ge $disk_threshold ]; then
        message+="High Disk Usage on $partion:$usage"
    fi  

done <<< $disk_usage

echo "Message Body: $message"
