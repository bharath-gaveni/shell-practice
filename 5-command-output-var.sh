#1/bin/bash
#var_name=$(command)
Start_Date=$(date +%s)
echo "Script start time: $Start_Date"
sleep 5
End_Date=$(date +%s)
echo "Script end time: $End_Date"
Total_Time= $(($End_Date-$Start_Date))
echo "Total time taken for script to execute is $Total_Time:seconds"

