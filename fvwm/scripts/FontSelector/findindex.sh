#!/bin/bash

index=1

fc-list : family 2>/dev/null | sort | while read line
do
    if [[ "${line}" == "$1" ]]; then
	echo "${index}"
    fi
    ((index++))
done
