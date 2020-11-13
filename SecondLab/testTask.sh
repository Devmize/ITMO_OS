#!/bin/bash

ps -e -o user,s,pid | awk '{if ($1 == "root" && $2 == "S") printf "user = %s s = %d pid = %d\n", $1, $2, $3}'
