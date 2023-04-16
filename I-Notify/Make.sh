#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   Make.sh
#
# Mounted volumes:
#   /watch
#   /index.qmd
#   /project.yml
#

generate() {
    /tools/Generate.sh /watch > /index.qmd
    echo "<!-- $(date +%s) -->" >> /index.qmd

    if [ -e /watch/Presentation.yml ]; then
        cat /tools/Template.yml /watch/Presentation.yml > /project.yml
    fi

    echo "Generated new configuration based on $(ls /watch | wc -l) files"
}

generate

inotifywait /watch -e create -e delete -e modify -mq --format '%:e %f' |
    while read -r MESSAGE; do
        echo "File $MESSAGE"
        echo "Skipping $(timeout 1 cat | wc -l) further changes to debounce filesystem events"
        [[ $MESSAGE =~ .*\.(md|qmd|yml|css)$ ]] && generate
    done
