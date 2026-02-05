#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
   echo "Error: Please run this script with root previlages" 
   exit 1 # failure is other than 0
fi 

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then 
      echo -e "Installation of $2 $R failed $N "
      exit 1 # failure is other than 0
    else 
     echo -e "Installation of $2 $G success $N"
    fi 

}


# dnf list installed mysql
# # Install if it is not found

dnf install mysql -y 
VALIDATE $? "MYSQL"


dnf install git -y 
VALIDATE $? "GIT"
 

dnf install python -y 
VALIDATE $? "PYTHON"