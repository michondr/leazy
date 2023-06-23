#!/bin/bash

#don't forget to run: sudo usermod -aG video michondr

VALUE=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
MAX_VALUE=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)

echo $VALUE of $MAX_VALUE
