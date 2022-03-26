#!/usr/bin/env bash

# name of the file that stores the last marquee selected
PREVIOUSGAMESELECTEDFILE="/opt/retropie/configs/all/emulationstation/.game-select"

PREVIOUSGAMESELECTED="$1"

if [ "$(cat "$PREVIOUSGAMESELECTEDFILE")" != "$PREVIOUSGAMESELECTED" ]; then
	curl --silent "http://localhost:8080/console/stream/$1" >> /dev/null 2>/dev/null &
	echo "$PREVIOUSGAMESELECTED" > "$PREVIOUSGAMESELECTEDFILE"
fi
