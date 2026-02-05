#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)


LOGS_FOLDER="/var/log/shell-script-logs"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #/var/log/shell-script-logs/18-logs.log


mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)"

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


 dnf list installed mysql &>>$LOG_FILE
 # Install if it is not found
 if [ $? -ne 0 ]; then
  dnf install mysql -y &>>$LOG_FILE
  VALIDATE $? "MYSQL"
else
  echo -e " Mysql already exists $Y skipping $N"
fi


dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
 dnf install nginx -y  &>>$LOG_FILE
 VALIDATE $? "nginx"
else
  echo -e " nginx already exists $Y skipping $N"
fi

 
dnf list installed  python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
 dnf install python3 -y  &>>$LOG_FILE
 VALIDATE $? "python3"
else
  echo -e " python3 already exists $Y skipping $N "
fi
