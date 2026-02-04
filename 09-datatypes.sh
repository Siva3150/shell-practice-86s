#!/bin/bash 

NUMBER1=100
NUMBER2=200 
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "SUM is: $SUM"

# Size = 4, Max index = 3
LEADERS=("Modi" "Putin" "Trudo" "Trump")

echo "All Leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]"
echo "Last Leader: ${LEADERS[10]"