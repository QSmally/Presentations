#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   normalise.sh
#
# Note:
#   This script requires a strict environment to work in, and must really only
#   be seen as a template or example.
#

mkdir -p Normalised
ln -sfw ../Slides/ Normalised/
ln -sfw ../Images/ Normalised/

"$(dirname $0)"/I-Notify/Make.sh \
    Normalised \
    Shared \
    Slides
