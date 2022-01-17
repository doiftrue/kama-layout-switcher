#!/bin/bash
#
# Depends on:
#     xdotool
#     xsel
#     g3kb-switch
#     sed
#     sleep
#
# Author: Kama
# Version: 1.0


# skip in windows: `terminal`
active_window=$(cat /proc/"$(xdotool getwindowpid "$(xdotool getwindowfocus)")"/comm)
if [[ $active_window == *terminal* ]] ; then
	exit 0
fi

#function trim_str(){
#    local trimmed="$1"
#
#    # Strip leading space.
#    trimmed="${trimmed## }"
#    # Strip trailing space.
#    trimmed="${trimmed%% }"
#
#    echo "$trimmed"
#    return 0
#}

# xdotool need to be run in `us` layout!
#orig_layout="$(g3kb-switch)";
g3kb-switch -s us

# clear possibly pressed modifiers
xdotool keyup Control_L Shift_L Alt_L

# select last word
xdotool key Control_L+Shift_L+Left
sleep 0.15

# Do replace
source "$(dirname "$0")"/_replace-core.sh

# switch to another layout
# notify-send $replace_direction
[[ $replace_direction == 'us_ru' ]] && g3kb-switch -s ru
#[[ $orig_layout == "us" ]] && g3kb-switch -s ru

exit 0 # Success
