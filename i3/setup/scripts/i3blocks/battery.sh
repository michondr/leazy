#!/bin/bash

BAT=$(acpi -b | grep 'Battery 1' | grep -E -o '[0-9]+?%')
BAT_TEXT=$(acpi -b | grep 'Battery 1' | grep -E -o '([0-9]+?%.*?$)')

# Full and short texts
echo " $BAT_TEXT"
echo " $BAT_TEXT"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -ge 95 ] && echo "#00FF00"
[ ${BAT%?} -le 20 ] && echo "#FF8000"

# Send notification when battery is under 10%
[ ${BAT%?} -le 10 ] && notify-send "Battery alert" "battery is at ${BAT}"

exit 0
