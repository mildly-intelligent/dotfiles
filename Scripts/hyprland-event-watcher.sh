#!/bin/bash

handle() {
	event=$(echo $1 | sed 's/>>.*//')
	args=$(echo $1 | sed 's/.*>>// ; s/,/ /')
	bash "$SCRIPTS/Events/on_$event.sh" $args
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
