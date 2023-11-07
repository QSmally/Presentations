#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   normalise.sh
#

mkdir -p Normalised
ln -sfw ../Slides/ Normalised/

"$(dirname $0)"/I-Notify/Make.sh \
    Normalised \
    Shared \
    Slides
