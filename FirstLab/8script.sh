#!/bin/bash

cat /etc/passwd | awk  -F: '{print ($1, $3)}' | sort -n -k 2

