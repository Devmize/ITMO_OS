#!/bin/bash

echo $$ > pidTemp

for((i=0; i<4; i++))
do
echo "Sea is warm" >> channel
sleep 1
done
for((i=0; i<3; i++))
do
echo "Sharks are comming" >> channel
done
echo "They are here" >> channel
exit 2

