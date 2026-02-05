#!/bin/bash 

echo "please enter your number:"
read NUMBER 

if [ $NUMBER -le 1 ];  then 
    echo "Given number: $NUMBER is prime"

else 

    echo "Given number: $NUMBER is not prime"
fi