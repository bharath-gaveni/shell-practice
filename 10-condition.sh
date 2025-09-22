#!/bin/bash

id=$(sudo id)

if [ $id -ne 0]; then
    echo "ERROR: you need root access privilage to execute the script"
fi