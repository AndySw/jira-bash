#!/bin/bash

BASE_URL=http://localhost:8080
USERNAME=api
PASSWORD=api
KANBAN_BOARD_ID=2

lines() {
    local number_of_newlines=$1
    local i=0
    while [ $i -lt $number_of_newlines ]
    do
        printf "\n"
        let i++
    done
}

http() {
    local verb=$1
    local url=${BASE_URL}${2}
    
    clear
    printf "${url}"
    lines 2
    curl -s -u "${USERNAME}:${PASSWORD}" -X $verb -H "Content-Type: application/json" $url | jq
    lines 1
}

# http GET /rest/api/2/issue/createmeta
http GET /rest/agile/1.0/board/${KANBAN_BOARD_ID}