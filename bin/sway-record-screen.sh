#!/bin/bash
wf-recorder -g "$(slurp)" -f "$HOME/recording-$(date +%Y-%m-%d_%H-%M-%S).mp4"
