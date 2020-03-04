#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]+?%')

# Full and short texts
echo "Battery: $BAT"
echo "BAT: $BAT"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -ge 95 ] && echo "#00FF00"
[ ${BAT%?} -le 20 ] && echo "#FF8000"

# Send notification when battery is under 10%
[ ${BAT%?} -le 10 ] && notify-send "Battery alert" "battery is under 10%"

exit 0
