#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   I-Notify.sh
#
# Mounted volumes:
#   /output
#   /tools
#   /defaults
#   /watch
#

generate() {
    "$(dirname $0)"/Make.sh /output /defaults /watch
    echo "Generated new configuration based on $(ls /watch | wc -l) files"
}

generate

inotifywait /defaults /watch -e create -e delete -e modify -mq --format '%f' |
    while read -r MESSAGE; do
        echo "File $MESSAGE"
        echo "Skipping $(timeout 1 cat | wc -l) further changes to debounce filesystem events"
        [[ $MESSAGE =~ .*\.(md|qmd|yml|css)$ ]] && generate
    done
