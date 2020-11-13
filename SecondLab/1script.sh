#!/bin/bash

ps -U root -o pid,command | tail -n +2 | awk '{print $1 " : " $2}' > firstTask.txt
echo "$(wc -l firstTask.txt | awk '{print $1}')" > firstTask.txt
ps -U root -o pid,command | tail -n +2 | awk '{print $1 " : " $2}' >> firstTask.txt

