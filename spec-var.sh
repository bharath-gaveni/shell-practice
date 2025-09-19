#!/bin/bash
echo "All values passed to the script:$@"
echo "All values passed to the script:$*"
echo "present working directory of the script:$PWD"
echo "Home directory of the user:$HOME"
echo "script name:$0"
echo "who is the user:$USER"
echo "PID of the script:$$"
sleep 20 &
echo "PID of last command in the background:$!"
