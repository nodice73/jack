#!/bin/bash

# Usage: start_jacktrip_server <number of clients>

# Get the number of clients from the command line.
CLIENTS=$1
echo "Setting up $CLIENTS clients"

# Start jack in the background.
# For this to work, you need to check
# "Start JACK audio server on application startup".
# On my version, this is in the "Misc" tab of the Setup.
qjackctl &

# Give it time to get started
sleep 5

# This script is necessary if your router only allows
# port triggering. It is included in this repository.
./triggerport.sh &

# Start the first server
jacktrip -s &

# We only need to do the rest if there is going
# to be more than one client.
if [ $CLIENTS -gt 1 ]
then
    i=1
    while [ $i -lt $CLIENTS ]
    do
        # Start a new server with port offset
        # of 10 each time.
        jacktrip -s -o$(($i*10)) &

        i=$(($i+1))
    done
fi
