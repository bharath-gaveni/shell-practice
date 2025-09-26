#!/bin/bash
# every dataype in shell consider as string
number1=345
number2=985
name=dakati
sum=$(($number1+$number2+$name))
echo "sum is: $sum"
 Leaders=("Bharath" "Modi" "Putin" "Trump")
 echo "All Leaders ${Leaders[@]}"
 echo "First Leader ${Leader[0]}"
 echo "second Leader ${Leader[1]}"
 echo "7th leader ${Leader[6]}"


 numbers=(234 456 567 545)
 echo "First number: ${number[@]}"
 echo "second number: ${number[0]}"
 echo "7th number: ${number[6]}"
 