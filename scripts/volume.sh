#!/bin/bash
amixer -D default | grep 'Front Left': | head -1 | sed 's_^[ a-zA-Z]\+: Playback [0-9]\+ \[\([0-9]\+%\)\]_Vol: \1_'
