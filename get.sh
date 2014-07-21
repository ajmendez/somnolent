#!/bin/bash

source ~/.limited/env

APPFILE="f2c74a8ab2a40bdae1796ae48dc47e19a69a52b0"
FILENAME="${HOME}/Library/Application Support/MobileSync/Backup/${UUID}/${APPFILE}"


pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null
OUTFILE="${SCRIPTPATH}/data/sleep_$(date +%Y.%m.%d).sqlite"
CURRFILE="${SCRIPTPATH}/data/current.sqlite"


if [ ! -f $OUTFILE ]; then
    echo 'Updating data'
    cp "$FILENAME" "$OUTFILE"
    ln -sf "$(basename $OUTFILE)" "$CURRFILE"
    echo "Latest file: $OUTFILE"
else
    echo 'File already exists: $OUTFILE'
fi 