#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   Make.sh
#
# Files:
#   /watch
#   /output.qmd
#

generate() {
    /tools/Generate.sh /watch > /output.qmd
    echo "<!-- $(date +%s) -->" >> /output.qmd
    echo "Generated new file index based on $(ls /watch | wc -l) files"
}

generate

inotifywait /watch -e create -e delete -e modify -mq --format '%:e %f' |
    while read -r MESSAGE; do
        echo $MESSAGE
        [[ $MESSAGE == *.qmd ]] && generate
    done
