#!/bin/bash

OUTPUT_DIR=/data/screenshots
OUTPUT_NAME=shot_`date +%Y%m%d%H%M%S`.png
REMOTE=kaliwe.ru
REMOTE_PREFIX=screenshots.kaliwe.ru/anton/
PATH_ON_REMOTE=screenshots/
ERR=/data/screenshots/err.log

if maim -s $OUTPUT_DIR/$OUTPUT_NAME ; then
    if [[ $1 == -e ]]; then
        gimp $OUTPUT_DIR/$OUTPUT_NAME
    fi

    # Copy via scp to remote serwer
    if scp $OUTPUT_DIR/$OUTPUT_NAME $REMOTE:$PATH_ON_REMOTE > /dev/null 2> $ERR && \
       echo -n "http://$REMOTE_PREFIX$OUTPUT_NAME" | xclip
    then
        notify-send "Sceenshot send to $REMOTE, URL coppied to clipboard"
    else
        notify-send "Smt went wrong. Shot saved as $OUTPUT_DIR/$OUTPUT_NAME"
    fi
	#echo $res | grep -qo '"status":200' && link=$(echo $res | sed -e 's/.*"link":"\([^"]*\).*/\1/' -e 's/\\//g')
	#test -n "$link" && (printf $link | xclip; printf "\a") || echo "$res" > "$img.error"
fi