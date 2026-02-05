#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
   echo "Error: Please run this script with root previlages" 
   exit 1
fi 

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then 
      echo "Installation of $2 failed"
      exit 1
    else 
     echo "Installation of $2 success"
    fi 

}



dnf install mysql -y 
VALIDATE $? "MYSQL"


dnf install git -y 
VALIDATE $? "GIT"
 

dnf install python -y 
VALIDATE $? "PYTHON"
