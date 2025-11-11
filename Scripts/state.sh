#!/bin/bash

state="$SETTINGS_DIR/Misc/state"

if [[ "$1" == "set" ]]; then
	if grep -qe "^$2\$" $state; then
		echo "State \`$2\` already set!" >/dev/stderr
		exit 2
	else
		echo "$2" >> $state
	fi
elif [[ "$1" == "unset" ]]; then
	if grep -qe "^$2\$" $state; then
		sed -ri "/^$2$/d" $state
	else
		echo "State \`$2\` cannot be unset as it does not exist!" >/dev/stderr
		exit 2
	fi
elif [[ "$1" == "get" ]]; then
	if grep -qe "^$2\$" $state; then
		echo "active"
	else
		echo "inactive"
	fi
else
	exit 1
fi