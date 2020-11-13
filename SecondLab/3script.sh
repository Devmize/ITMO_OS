#!/bin/bash

ps -Ao pid,stime | tail -n +2 | sort -k2 -r | head -1 | awk '{print $1}'
