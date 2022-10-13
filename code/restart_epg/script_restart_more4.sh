#!/bin/bash -x

# Look for pid number of script, if running exit, if not, relaunch.

DATE=$(date +%Y/%m/%d)

if pgrep -f 'epg_channel_recorder.py more4';
  then
    echo "SCRIPT IS ALREADY RUNNING. Exiting."
    exit 1
  else
    echo "** SCRIPT NOT RUNNING. LAUNCHING NOW"
    DATETIME=$(date +%Y-%m-%d_%H:%M:%S)
    touch "${STORAGE_PATH}${DATE}/more4/restart_${DATETIME}.txt"
    "${CODE}ENV/bin/python3" "${CODE}epg_channel_recorder.py" "more4" >> "${STORAGE_PATH}${DATE}/more4/recording.log" 2>&1
fi
