#!/bin/bash

OUTPUT_DIR=$HOME/screenshots
OUTPUT_NAME=shot_`date +%Y%m%d%H%M%S`.png
REMOTE=kaliwe.ru
REMOTE_PREFIX=screenshots.kaliwe.ru/anton/
PATH_ON_REMOTE=screenshots/
ERR=$OUTPUT_DIR/err.log

if maim -s $OUTPUT_DIR/$OUTPUT_NAME ; then
    if [[ $1 == -e ]]; then
        gimp $OUTPUT_DIR/$OUTPUT_NAME
    fi

    # Copy via scp to remote server
    if scp $OUTPUT_DIR/$OUTPUT_NAME $REMOTE:$PATH_ON_REMOTE > /dev/null 2> $ERR && \
       echo -n "http://$REMOTE_PREFIX$OUTPUT_NAME" | xclip
    then
        notify-send "Seen shot send to $REMOTE, URL copied to clipboard"
    else
        notify-send "Smt went wrong. Shot saved as $OUTPUT_DIR/$OUTPUT_NAME"
    fi
fi
