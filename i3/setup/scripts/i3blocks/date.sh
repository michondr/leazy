#!/bin/bash

# still fails on click to return to refreshing

BTN=$BLOCK_BUTTON

DATE=$(date '+%Y-%m-%d %H:%M:%S')


if [ $BTN == 1 ]; then
	notify-send "date coppied"
	echo $DATE | xclip -selection clipboard
fi

echo $DATE


exit 0
