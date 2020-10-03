#!/bin/bash

echo "Enter 1: If you want open nano."
echo "Enter 2: If you want open vim."
echo "Enter 3: If you want open browser."
echo "Enter 4: If you want to exit from file."

read number

if [[ $number -eq 1 ]]
then nano
fi

if [[ $number -eq 2 ]]
then vi
fi

if [[ $number -eq 3 ]]
then links google.com
fi

if [[ $number -eq 4 ]]
then exit
fi
