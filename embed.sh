#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   embed.sh
#

set -e

basedirectory="$(dirname "$0")"

mkdir -p Slides/
mkdir -p Images/

ln -sfw "$basedirectory/Shared/" .
ln -sfw "$basedirectory/I-Notify/" .
ln -sfw "$basedirectory/normalise.sh" .
