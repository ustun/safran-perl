#!/bin/sh
curl -sL safran.io/feed.rss | perl -wnl -e '/(title|link)/ and s/<\w*\/?(title|link)>//g and print "$_\n";'

