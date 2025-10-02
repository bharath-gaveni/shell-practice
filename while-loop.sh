#!/bin/bash

# echo "count begins::::"
# count=5
# while [ $count -gt 0 ]
# do
#     echo "Time left ${count}"
#     sleep 1
#     count=$(($count-1))
# done
#     echo "Your time is Up!!!!"

while IFS= read -r linebyline
do
    echo "reading input file line by line using while loop: ${linebyline}"
done < script1.sh


