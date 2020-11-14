#!/bin/bash

at now + 2 minutes -f ./1script.sh
tail -n 0 -f ~/report &
