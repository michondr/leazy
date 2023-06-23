#!/bin/bash

#don't forget to run: sudo usermod -aG video michondr

VALUE=$(cat /sys/class/backlight/amdgpu_bl0/brightness)

if [[ $VALUE -ge 80 ]]; then
  STEP=25
elif [[ $VALUE -ge 30 ]]; then
  STEP=10
else
  STEP=5
fi

echo $(($VALUE-$STEP)) > /sys/class/backlight/amdgpu_bl0/brightness
