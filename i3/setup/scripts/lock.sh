#!/usr/bin/env bash

#icon="$HOME/.xlock/icon.png"
#tmpbg='/tmp/screen.png'
#
#(( $# )) && { icon=$1; }
#
#scrot "$tmpbg"
#convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
#i3lock -i "$tmpbg"

if [ $(date +"%H") -ge 21 ]
then
  i3lock -c 000000
else
  rm /tmp/screenshot.png
  scrot /tmp/screenshot.png
  convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png

  i3lock -i /tmp/screenshotblur.png
fi