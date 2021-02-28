#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r left-one & polybar -r left-two & polybar -r left-three & polybar -r left-four & polybar -r right-one &
