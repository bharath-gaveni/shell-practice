#!/bin/bash

echo "please enter the number"
read number

if [ $(($number % 2)) -eq 0 ]; then
    echo "Given number is EVEN"
else 
    echo "Given number is ODD"
fi        