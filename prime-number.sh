#!/bin/bash 

echo "please enter your number:"
read NUMBER 

if [ $(($NUMBER % 1)) -eq 0 ];  then 
    echo "Given number: $NUMBER is prime"

else 

    echo "Given number: $NUMBER is nor prime"
fi