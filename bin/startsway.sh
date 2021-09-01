#!/bin/bash

export WLR_DRM_NO_MODIFIERS=1 
if [ -z $DISPLAY ] ; then
  exec sway >> ~/sway.log 2>&1
else
	echo "Display already set"
fi


