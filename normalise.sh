#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   normalise.sh [directory]
#
# Note:
#   This script requires a strict dependency on Shared and Slides directories,
#   as well as an Images directory which is symlinked.
#

outdirectory="${1:-Normalsed}"

set -e

mkdir -p $outdirectory

basedirectory="$(cd "$(dirname "$0")"; pwd)"
ln -sfw $basedirectory/Slides/ $outdirectory/
ln -sfw $basedirectory/Images/ $outdirectory/

"$(dirname $0)"/I-Notify/Make.sh \
    $outdirectory \
    Shared \
    Slides
