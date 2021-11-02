#!/bin/bash

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  export WLR_DRM_NO_MODIFIERS=1 
  exec sway|systemd-cat --identifier=sway
fi
