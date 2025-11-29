#!/bin/bash

cd "$WALLPAPER_DIR" || exit 1
IFS=$'\n'

# === SELECT RANDOM WALLPAPER ===
WALLS=($(ls *.jpg *.jpeg *.png *.gif 2>/dev/null))
COUNT=${#WALLS[@]}
[ "$COUNT" -eq 0 ] && exit 1

RANDOM_WALL=${WALLS[$RANDOM % $COUNT]}
SELECTED_PATH="$WALLPAPER_DIR/$RANDOM_WALL"

# === UPDATE SYMLINK ===
ln -sf "$SELECTED_PATH" "$CURRENT_WALLPAPER_SYMLINK"

# === SET WALLPAPER ===
$SCRIPTS_PATH/setwp.sh