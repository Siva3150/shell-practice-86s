#!/bin/bash 

echo "please enter your number:"
read NUMBER 

if [ $(($NUMBER % 2)) ];  then 
echo "Given number: $NUMBER is even"

else 

echo "Given number: $NUMBER is odd"