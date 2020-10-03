#!/bin/bash

man bash | grep -i -o "[a-z]\{4,\}" | sort | uniq -c | sort -n -r | head -3 | awk '{print($2)}'

