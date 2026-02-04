#!/bin/bash 

echo "All variables passed to the script:$@" 
echo "All variables passed to the script:$*"
echo "script name:$0"
echo "current directory of the script:$PWD"
echo "Owner of the script:$USER"
echo "Home Directory of the user:$HOME"
echo "process id of the script:$$"
sleep 50 &
echo "process id of the last executed command:$!"

