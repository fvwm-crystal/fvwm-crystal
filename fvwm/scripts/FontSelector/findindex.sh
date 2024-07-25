#!/bin/bash
# Find the index of a font
# Syntax:	findindex.sh "<font name>"

index=1

"${FVWM_SYSTEMDIR}"/scripts/FontSelector/getlistindex | while read -r line
do
    if [[ "${line}" == "$1" ]]; then
	echo "${index}"
    fi
    ((index++))
done
