#!/bin/bash

read -p "enter file name : " FILE

if [ -f "$FILE" ]; then
 echo "file exists"
else 
 echo " not exists"
fi