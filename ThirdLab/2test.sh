#!/bin/bash

tail -f channel | while true
do
read line
if [[ $line == "Sharks are comming" ]]
then
kill $(cat pidTemp)
echo "Saved"
exit 1
fi
sleep 5
done

