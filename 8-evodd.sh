#!/bin/bash
number=$1

if [ $(($number % 2)) -eq 0 ]; then
    echo "Given number $number is EVEN"
else
    echo "Given number $number is ODD"
fi