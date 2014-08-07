#!/bin/bash

IFS=$'\n'

item_counter=0

for i in `curl -Ls safran.io/feed.rss`; do
    IFS=$'<>';
    contains=0
    title=0

    for y in $i; do
        if [[ $y == "title" || $y == "description" || $y == "link" ]]; then
            contains=1
            if [[ $y == "title" ]]; then
                title=1
                ((item_counter++))
            fi
        fi
    done

    if [[ contains -eq 1 ]]; then
        counter=0
        for y in $i; do
            ((counter++))
            if [[ $counter -eq 3 ]]; then
                if [[ $title -eq 1 ]]; then
                    printf "%2d. " $item_counter
                fi
                echo "$y";
                echo ""
            fi
        done
    fi
done
