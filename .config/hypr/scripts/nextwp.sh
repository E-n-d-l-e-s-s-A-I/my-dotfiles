#!/bin/bash

MODE="$1"
DELATA="$2"
cd "$WALLPAPER_DIR" || exit 1
IFS=$'\n'

# === FIND NEXT WALLPAPER===
WALLS=($(ls -1 *.jpg *.jpeg *.png *.gif 2>/dev/null))
COUNT=${#WALLS[@]}
[ "$COUNT" -eq 0 ] && exit 1

CURRENT_NAME=$(basename "$(readlink "$CURRENT_WALLPAPER_SYMLINK")")

CURRENT_INDEX=-1
for i in "${!WALLS[@]}"; do
    if [[ "${WALLS[$i]}" == "$CURRENT_NAME" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

if [[ "$CURRENT_INDEX" -eq -1 ]]; then
    NEXT_INDEX=0
else
    if [[ "$MODE" == "--next" ]]; then
        NEXT_INDEX=$(( (CURRENT_INDEX + DELATA) % COUNT ))
    elif [[ "$MODE" == "--prev" ]]; then
        NEXT_INDEX=$(( (CURRENT_INDEX - DELATA + COUNT) % COUNT ))
    fi
fi

NEXT_WALL="${WALLS[$NEXT_INDEX]}"
SELECTED_PATH="$WALLPAPER_DIR/$NEXT_WALL"

# === UPDATE SYMLINK ===
ln -sf "$SELECTED_PATH" "$CURRENT_WALLPAPER_SYMLINK"

# === SET WALLPAPER ===
$SCRIPTS_PATH/setwp.sh