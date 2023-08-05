#!/bin/bash

TEMP=$(sensors | grep -Po "(?<=Package id 0:  )(.*?)\s")

echo $TEMP

exit 0
