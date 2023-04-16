#!/bin/bash

#
# © 2023 Joey Smalen ("Smally", "QSmally")
#
# Command usage:
#   Make.sh
#
# Mounted volumes:
#   /output
#   /tools
#   /defaults
#   /watch
#

generate() {
    /tools/Generate.sh /watch > /output/index.qmd
    echo "<!-- $(date +%s) -->" >> /output/index.qmd
    cp /defaults/Styling.css /output/style.css

    if [ -e /watch/Presentation.yml ]; then
        cat /defaults/Defaults.yml /watch/Presentation.yml > /output/_quarto.yml
    else
        cp /defaults/Defaults.yml /output/_quarto.yml
    fi

    echo "Generated new configuration based on $(ls /watch | wc -l) files"
}

generate

inotifywait /defaults /watch -e create -e delete -e modify -mq --format '%f' |
    while read -r MESSAGE; do
        echo "File $MESSAGE"
        echo "Skipping $(timeout 1 cat | wc -l) further changes to debounce filesystem events"
        [[ $MESSAGE =~ .*\.(md|qmd|yml|css)$ ]] && generate
    done
