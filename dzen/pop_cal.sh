#!/bin/bash

. /scripts/theme.sh

TODAY=$(expr `date +'%d'` + 0)

OUT=$(
echo # Empty title
cal -m $(date --date "-1 month" +"%m %Y") | sed '/^\s*$/d'
echo
cal -m | sed '/^\s*$/d' | sed -r -e "s/(^| )($TODAY)($| )/\1^bg($myLighterstGray)^fg($myBlack)\2^fg()^bg()\3/"
echo
cal -m $(date --date "+1 month" +"%m %Y") | sed '/^\s*$/d'
)

LINES=$(wc -l <<< $OUT)
LINES=$((LINES - 1))

WIDTH=150
MONITOR_WIDTH=1366
XPOS=$((MONITOR_WIDTH - WIDTH - 4))

(
echo $OUT
sleep 5
) | dzen2 -x $XPOS -y 2 -w $WIDTH -h 18 -l $LINES -sa c \
-e 'onstart=uncollapse,hide;button1=exit;button3=exit;' \
-title-name "calendar_popup" \
-bg $myBlack -fg $myLighterstGray -fn "$myFont"

