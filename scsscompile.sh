#!/bin/bash
curFile=GenericTech
infile=scss/$curFile.scss
oufile=css/$curFile.css

while [ 1 ]; do

    [[ ! -f $oufile ]] && touch $oufile
    [[ ! -f $infile ]] && touch $infile

    intime=`date +%s -r $infile`
    outime=`date +%s -r $oufile`
    if (( $intime > $outime )); then
        sassc $infile $oufile
    fi
    [ -z $RUN_FOREVER ] && exit 0
    sleep 1
done
