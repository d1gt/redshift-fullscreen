# redshift-fullscreen
Script that disables redshift when active window is in fullscreen 

## Requirements 
xdotool
xprop

## How to use
Pass redshift arguments to script

```./redshift-fullscreen.sh -O 5000```

## i3wm example
```exec --no-startup-id ~/redshift-fullscreen/redshift-fullscreen.sh -O 5000```

