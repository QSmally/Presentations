#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   Generate.sh <target> > <output>
#
# <target>: a directory target of the slides to generate the include index from.
#

if [ $# -ne 1 ]; then
    echo "error: amount of arguments must be exactly 1, was given $#"
    exit 1
fi

ls -1 "$1" | \
    sort | \
    sed 's/\(.*\)/{{< include Slides\/\1 >}}/'
