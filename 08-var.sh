#!/bin/bash

number=$1

if [ $number -lt 12 ]; then
    echo "Given number is less than 12"
elif [ $number -eq 12 ]; then
    echo "Given number is equal to 12"    
else 
    echo "Given number is greater than 12"
fi    