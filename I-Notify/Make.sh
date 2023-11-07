#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   Make.sh <output> <defaults> <target>
#
# <output>:   an output directory.
# <defaults>: files containing a CSS and YAML file.
# <target>:   forwarded directory to the generation script.
#

if [ $# -ne 3 ]; then
    echo "error: amount of arguments must be exactly 3, was given $#"
    exit 1
fi

"$(dirname $0)"/Generate.sh "$3" > "$1"/index.qmd
echo "<!-- $(date +%s) -->" >> "$1"/index.qmd
cp "$2"/Styling.css "$1"/style.css

if [ -e "$3"/Presentation.yml ]; then
    cat "$2"/Defaults.yml "$3"/Presentation.yml > "$1"/_quarto.yml
else
    cp "$2"/Defaults.yml "$1"/_quarto.yml
fi
