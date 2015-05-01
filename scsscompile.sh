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
        echo "Timestamp change detected at "`date`"; Compiling SASS"
        sass $infile $oufile 
    fi
    sleep 1
done
