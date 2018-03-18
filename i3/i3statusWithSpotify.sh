#!/bin/bash

i3status | while :
do
    read line
    playerStatus=`playerctl status`
    spotify=""
    if [ "$playerStatus" = "Playing" ]; then
        title=`playerctl metadata title`
        artist=`playerctl metadata xesam:artist`
        spotify="♫ $title - $artist | "
    fi
    echo "$spotify$line" || exit 1
done

