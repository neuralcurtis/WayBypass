#!/bin/bash

THRESHOLD_FILE="/sys/class/power_supply/BAT0/charge_control_end_threshold"

#if [[ ! -w "$THRESHOLD_FILE" ]]; then
#    echo "Error: No write access to $THRESHOLD_FILE"
#    exit 1
#fi

CURRENT=$(cat "$THRESHOLD_FILE")

if [[ "$CURRENT" == "80" ]]; then
    echo 100 | sudo /usr/bin/tee "$THRESHOLD_FILE" > /dev/null
    echo "Bypass: OFF (100%)"
else
    echo 80 | sudo /usr/bin/tee "$THRESHOLD_FILE" > /dev/null
    echo "Bypass: ON (80%)"
fi

