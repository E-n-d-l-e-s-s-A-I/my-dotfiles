#!/bin/bash
# === GEN AND APPLY COLOR SCHEM ===
matugen image $CURRENT_WALLPAPER_SYMLINK

# IF you use hyprpaper
# === SET WALLPAPER ===
# hyprctl hyprpaper unload all
# hyprctl hyprpaper preload "$CURRENT_WALLPAPER_SYMLINK"

# MONITORS=$(hyprctl monitors -j | jq -r '.[].name')
# for monitor in $MONITORS; do
#     echo $monitor
#     hyprctl hyprpaper wallpaper "$monitor,$CURRENT_WALLPAPER_SYMLINK"
# done

