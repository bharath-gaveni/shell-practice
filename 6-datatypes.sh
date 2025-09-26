#!/bin/bash
# every dataype in shell consider as string
number1=345
number2=985
name=dakati
sum=$(($number1+$number2+$name))
echo "sum is: $sum"


 Leaders=("Bharath" "Modi" "Putin" "Trump")
 echo "All Leaders ${Leaders[@]}"
 echo "First Leader ${Leaders[0]}"
 echo "second Leader ${Leaders[1]}"
 echo "7th leader ${Leaders[6]}"



 numbers=("234" "456" "567" "545")
 echo "All number: ${numbers[@]}"
 echo "first number: ${numbers[0]}"
 echo "second number: ${numbers[1]}"
 echo "7th number: ${numbers[6]}"
