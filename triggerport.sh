#!/bin/bash

# When run, triggerport periodically sends a packet
# through the specified port in order to open an incoming port.
# Necessary if using port triggering to open up your jack ports.

# Set this port as your trigger in your router.
# The number isn't important, but this one works and won't
# interfere with other stuff.
TRIGGERPORT=4031

while true; do
    echo -n "hello" | nc -4u -w0 google.com $TRIGGERPORT
    sleep 10
done
