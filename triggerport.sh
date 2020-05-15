#!/bin/bash

while true; do
    echo -n "hello" | nc -4u -w0 google.com 4000
    sleep 10
done
