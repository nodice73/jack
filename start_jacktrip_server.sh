#!/bin/bash

qjackctl &
sleep 5
bash triggerport.sh &
jacktrip -s &

CLIENTS=$1
echo $CLIENTS

if [ $CLIENTS -gt 1 ]
then
    i=1
    while [ $i -lt $CLIENTS ]
    do
        jacktrip -s -o$(($i*10)) &
        i=$(($i+1))
    done
fi
