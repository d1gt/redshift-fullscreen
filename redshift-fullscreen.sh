#!/bin/bash

REDSHIFT_STATUS="disabled"
REDSHIFT_ARGS="$@"


enable_redshift() {
    if [ "$REDSHIFT_STATUS" != "enabled" ]; then
        redshift $REDSHIFT_ARGS  > /dev/null & 
        REDSHIFT_STATUS="enabled"
    fi
}

disable_redshift() {
    if [ "$REDSHIFT_STATUS" != "disabled" ]; then
        redshift -x  > /dev/null 
        REDSHIFT_STATUS="disabled"
    fi
}


while true; do

    WIN_ID=$(xdotool getactivewindow)

    WIN_STATE=$(xprop -id "$WIN_ID" _NET_WM_STATE | grep '_NET_WM_STATE_FULLSCREEN')
    
    if [[ "$WIN_STATE" == *"_NET_WM_STATE_FULLSCREEN"* ]]; then
        disable_redshift
    else
        enable_redshift
    fi

    sleep 1
done
