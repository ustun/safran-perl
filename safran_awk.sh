#!/bin/sh
curl -sL safran.io/feed.rss | awk 'BEGIN {counter=0;}
     /<(title|link|description)/ {counter++; if ((counter-1)%3 == 0) { printf("%2d",(counter-1)/3);} gsub(/\s*<\/?(title|link|description)>/, ""); print " "$0"\n";}'
