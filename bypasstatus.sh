#!/bin/bash

THRESHOLD_FILE="/sys/class/power_supply/BAT0/charge_control_end_threshold"

if [[ -f "$THRESHOLD_FILE" ]]; then
    CURRENT=$(cat "$THRESHOLD_FILE")

    if [[ "$CURRENT" == "80" ]]; then
        echo '{ "text": "󱞜 Bypass", "tooltip": "Charging limited to 80%", "class": "on" }'
    else
        echo '{ "text": "󱟢 Full", "tooltip": "Charging up to 100%", "class": "off" }'
    fi
else
    echo '{ "text": "N/A", "tooltip": "No battery status", "class": "error" }'
fi

