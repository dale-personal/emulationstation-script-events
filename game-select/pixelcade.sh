#!/usr/bin/env bash

ROMNAME=$(basename "$2")

URLENCODED_FILENAME="$(python -c "import urllib, sys; print urllib.quote(sys.argv[1].lower())" "${ROMNAME%.*}")"

PIXELCADEBASEURL="http://localhost:8080/"
PIXELCADEURL="arcade/stream/$1/$URLENCODED_FILENAME"

# name of the file that stores the last marquee selected
PREVIOUSGAMESELECTEDFILE="/opt/retropie/configs/all/emulationstation/.game-select"

# get the last previously selected game for the marquee
PREVIOUSGAMESELECTED=$(cat "$PREVIOUSGAMESELECTEDFILE" 2>/dev/null)

LOWER_FILENAME="$(python -c "import urllib, sys; print sys.argv[1].lower()" "${ROMNAME%.*}")"

if [ ! -d "~/pixelcade/$1" ] || [ -f "~/pixelcade/$1/$LOWER_FILENAME.png" ] || [ -f "~/pixelcade/$1/$LOWER_FILENAME.gif" ]; then
  CURRENTGAMESELECTED="$1/$ROMNAME"
else
  CURRENTGAMESELECTED="$1"
fi

if [ "$CURRENTGAMESELECTED" != "$PREVIOUSGAMESELECTED" ]; then
  curl --silent "$PIXELCADEBASEURL$PIXELCADEURL" >> /dev/null 2>/dev/null &
  echo "$CURRENTGAMESELECTED" > "$PREVIOUSGAMESELECTEDFILE"
fi

