#!/bin/sh
curl -sL safran.io/feed.rss | perl -wnl -e '
s/\s*<\/?title>//g and ++$counter and printf("%2d. %s\n\n", $counter, $_);
s/\s*<\/?(link|description)>//g and print "    $_\n";'
