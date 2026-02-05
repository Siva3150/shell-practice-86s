#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
   echo "Error: Please run this script with root previlages" 
   exit 1
fi 

dnf install mysqlagggg -y 

if [ $? -ne 0 ]; then 
   echo "Installation of mysql failed"
   exit 1
else 
   echo "Installation of mysql success"
fi 