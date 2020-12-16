#!/usr/bin/env bash
if [ $2 = '..' ]; then
    `dirname $0`/getprevdir.py "${1}"
else
    # if clic on empty list
    if [ "$2" = "0" ]; then
	`dirname $0`/getprevdir.py "${1}"
    else
	`dirname $0`/getdir.py "$1"|head -n$2|tail -n1
    fi
fi
