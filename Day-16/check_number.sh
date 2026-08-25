#!/bin/bash

read -p "enter number you check : " number

if [ "$number" -ge 0 ]; then
 echo "Positive"
elif [ "$number" -lt 0 ]; then
 echo "Negative"
else
 echo "zero"
fi 