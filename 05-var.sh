#!/bash/bin

#VAR_NAME=$(command)

START_TIME=$(date +%s)
sleep 10
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "Time taken for the script to execute $TOTAL_TIME seconds"


