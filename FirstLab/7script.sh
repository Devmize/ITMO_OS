#!/bin/bash

grep -i -o -h -s -I -E "[a-z0-9._-]+@[a-z._-]+\.[a-z]" -r /etc/ | uniq | awk '{printf("%s, ", $1)}' > emails.lst

