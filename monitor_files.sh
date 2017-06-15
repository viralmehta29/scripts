#!/bin/bash

# This script checks for the files modified from the last check. If this script is run a minutely basis, then it will chek for the files modified

# in last one minute.

# This script can safely be run at seconds level but still it will check for files modificaiton time on minutely basis. In case a script is run with difference of more than 1 minute,

#, the script will check for hte first minute(s) of difference and over flow seconds, will be checked on next run.

systime=`date +%s`

# Get epoch time

last_check_time=`cat file_watcher.log`

# Try to get last run time for the current script. if last run time is not recorded that means we are runing script for the very first time and pickup all files.

if [ -z "$last_check_time" ]; then

  $last_check_time=0

fi

echo $last_check_time " " $systime " systime time"

# Calculate seconds from the last run

diff_sec=$(echo $(( systime - last_check_time )))

# Calculate minutes from the last run

diff_min=$(echo $(( diff_sec/60 )))

#Calculate current checks end point. e.g. if script has 75 seconds difference, we are checking for only 60 seconds and remaining 15 seconds will be checked in next run.

last_check_time_to_write=$(echo $(( systime - overflow_sec )))

# Record the time for hte next run analysis



echo $last_check_time_to_write >file_watcher.log

echo "Date difference is " $diff_sec " seconds"

echo "Date difference is " $diff_min " Minutes"



# Print the list of files modified in last X minutes into /root folder. Change it as needed.

find /root  -mmin  -$diff_min  -type f -print >modified_list.log




