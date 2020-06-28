#!/bin/sh
#
# Get duration in days since last "pacman -Syu".

command -v pacman >/dev/null || {
    printf 'err: %s\n' "command 'pacman' not found."
    exit 1
}

last_update=$(grep Running\ \'pacman\ -Syu /var/log/pacman.log | tail -1 | awk '{print $1, $2}' | sed 's/[][]//g' | cut -dT -f1)

update_timestamp=$(date -d "${last_update}" +%s)
current_timestap=$(date +%s)

difference=$((current_timestap - update_timestamp))

duration=$(( difference / 86400 ))

output="${duration} day(s) ago"

printf '%s' "$output"
