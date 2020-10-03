#!/bin/bash

let inputLine finalLine
while true
do
read inputLine
if [[ $inputLine != "q" ]]
then
finalLine+=$inputLine
else
break
fi
done

echo "$finalLine"

exit
