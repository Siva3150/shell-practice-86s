#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
   echo "Please proceed with root previlages" 
fi 

dnf install mysql -y 

if [ $? -ne 0 ]; then 
   echo "Installation of mysql failed"
else 
   echo "Installation of mysql success"
fi 