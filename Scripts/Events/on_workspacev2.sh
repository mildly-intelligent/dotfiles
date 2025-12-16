#!/bin/bash

# emitted on workspace change. Is emitted ONLY
# when a user requests a workspace change, and is
# not emitted on mouse movements (see `focusedmon`)
#
# $1 - WORKSPACEID
# $2 - WORKSPACENAME

swww img $SETTINGS_DIR/Wallpapers/$1 -t any