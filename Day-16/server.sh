#!/bin/bash

SERVICE="nginx"

read -p "Do you want to check the status? (y/n): " ANSWER

if [ "$ANSWER" = "y" ]; then

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is active."
    else
        echo "$SERVICE is not active."
    fi

elif [ "$ANSWER" = "n" ]; then
    echo "Skipped."

else
    echo "Invalid choice."
fi