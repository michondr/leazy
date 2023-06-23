#!/bin/bash

#don't forget to run: sudo usermod -aG video michondr

LOCATION=/sys/class/backlight/amdgpu_bl0/brightness
VALUE=$(cat $LOCATION)

echo $(($VALUE+25)) > $LOCATION
