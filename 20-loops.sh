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
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then 
   echo "Error: Please run this script with root previlages" 
   exit 1 # failure is other than 0
fi 

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then 
      echo -e "Installation of $2 $R failed $N " | tee -a $LOG_FILE
      exit 1 # failure is other than 0
    else 
     echo -e "Installation of $2 $G success $N" | tee -a $LOG_FILE
    fi 

}

#$@

for package in $@
do 
  dnf list installed $package &>>$LOG_FILE 

  if [ $? -ne 0 ]; then 
    dnf install $package -y &>>$LOG_FILE
    validate $? "$package"
    else 
    echo -e " $package already exists $Y skipping $N" | tee -a $LOG_FILE
  fi 
     
done 


