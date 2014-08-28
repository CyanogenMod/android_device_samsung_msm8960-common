#!/bin/bash

set -e

function extract() {
    for FILE in `egrep -v '(^#|^$)' $1`; do
        OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
        FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
        DEST=${PARSING_ARRAY[1]}
        if [ -z $DEST ]; then
            DEST=$FILE
        fi
        DIR=`dirname $FILE`
        if [ ! -d $2/$DIR ]; then
            mkdir -p $2/$DIR
        fi
        # Try CM target first
        if [ "$SOURCEDIR" != "" ]; then
            cp /$SOURCEDIR/$DEST $2/$DEST
        else
            adb pull /system/$DEST $2/$DEST
        fi
        # if file does not exist try OEM target
        if [ "$?" != "0" ]; then
            if [ "$SOURCEDIR" != "" ]; then
                cp /$SOURCEDIR/$FILE $2/$DEST
            else
                adb pull /system/$FILE $2/$DEST
            fi
        fi
    done
}


BASE=../../../vendor/$VENDOR/msm8960-common/proprietary
rm -rf $BASE/*

DEVBASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $DEVBASE/*

extract ../msm8960-common/proprietary-files.txt $BASE
extract ../$DEVICE/proprietary-files.txt $DEVBASE

./../msm8960-common/setup-makefiles.sh
