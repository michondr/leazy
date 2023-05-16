#!/bin/sh

focusedwindow=$(xdotool getactivewindow)
flameshot gui  >/dev/null

if [ "$focusedwindow" -eq "$(xdotool getactivewindow)" ]
then
	xdotool windowactivate $focusedwindow
fi