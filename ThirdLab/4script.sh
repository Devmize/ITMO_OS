#!/bin/bash


./infinity.sh & p1=$!
./infinity.sh & p2=$!
./infinity.sh & p3=$!

renice 10 -p $p1
kill $p3

