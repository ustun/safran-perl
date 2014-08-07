#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function check_req {
    req_name=$1
    err_message=$2
    type $req_name >/dev/null 2>&1 || { echo >&2 $err_message; exit 1; }
}

function check_requirements {
    check_req jq "Install jq at http://stedolan.github.io/jq/download/ Aborting."
    check_req xml2json "Install xml2json with npm install -g xml2json-command. Aborting."
}

function parse_safran {
    curl -Ls safran.io/feed.rss | xml2json | jq -r '.rss.channel.item[] |  .title."$t", .description."$t", .link."$t", ""'
}

check_requirements
parse_safran
