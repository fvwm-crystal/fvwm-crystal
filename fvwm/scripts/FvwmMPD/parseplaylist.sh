#!/usr/bin/env bash
#thanks to axxo for providing something more streamlined than the evil convoluted code I came up with;)
current=$(mpc | head -n 1)
mpc playlist | while read line; do
    if [[ "${line#* }" == "${current}" ]]; then
        echo ${line/\#/>}
    else
        echo ${line}
    fi
done
