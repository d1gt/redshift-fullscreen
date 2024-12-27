#!/bin/bash

REDSHIFT_STATUS="disabled"
REDSHIFT_ARGS="$*"

enable_redshift() {
    if [ "$REDSHIFT_STATUS" != "enabled" ]; then
        redshift "$REDSHIFT_ARGS" > /dev/null & 
        REDSHIFT_STATUS="enabled"
    fi
}

disable_redshift() {
    if [ "$REDSHIFT_STATUS" != "disabled" ]; then
        redshift -x > /dev/null 
        REDSHIFT_STATUS="disabled"
    fi
}

WIN_ID=$(xdotool getactivewindow)
xprop -spy -id "$WIN_ID" _NET_WM_STATE | while read -r; do
WIN_STATE=$(xprop -id "$WIN_ID" _NET_WM_STATE | grep '_NET_WM_STATE_FULLSCREEN')
if [[ "$WIN_STATE" == *"_NET_WM_STATE_FULLSCREEN"* ]]; then
	disable_redshift
else
	enable_redshift
fi
done
