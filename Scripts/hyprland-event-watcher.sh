#!/bin/bash

handle() {
  event=$(echo $1 | sed 's/>>.*//')
  args=$(echo $1 | sed 's/.*>>// ; s/,/ /')
  bash /home/aurora/Settings/Scripts/Events/on_$event.sh $args
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done