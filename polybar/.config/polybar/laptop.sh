#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r laptop-one & polybar -r laptop-two & polybar -r laptop-three & polybar -r laptop-four &
