#!/bin/sh
curl -sL safran.io/feed.rss | perl -wnl -e '
BEGIN{my $counter = 0;}
/<title/ and $counter++;
/<title/ and s/\s*<\/?title>//g and printf("%2d. %s\n\n", $counter, $_);
/<link/ and s/\s*<\/?link>//g and print "    $_\n";
/<description/ and s/\s*<\/?description>//g and print "    $_\n";'
