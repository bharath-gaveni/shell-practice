#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "user home directory: $HOME"
echo "Script name: $0"
echo "user who is running the scrip: $USER"
echo "PID of the scrip: $$"
echo "current working directory: $PWD"
sleep 50 &
echo "PID of the last executed command in the background: $!"
