#!/bin/bash


while [[ 1 ]] ; do
    json_resume convert --out=html resume.json
    [[ $? != 0 ]] && play -n synth sine fade h 0.1 0.2 0.1
    ./fixup.sh
    sleep 2
done
