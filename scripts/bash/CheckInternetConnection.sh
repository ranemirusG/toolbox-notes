#!/bin/bash

# Define the address to ping
ping_address="8.8.8.8"

# Path to the sound file
sound_path="/path/to/notify.wav"

# Function to check internet connectivity
function test_internet_connection {
    ping -c 1 $ping_address &> /dev/null
    return $?
}

# Function to play a sound notification
function play_sound {
    aplay $sound_path
}

# Loop until internet connection is detected
while ! test_internet_connection; do
    echo "No internet connection. Checking again in 10 seconds..."
    sleep 10
done

# Alert when internet connection is detected
echo "Internet connection established!"

# Loop to repeatedly play the sound until interrupted by the user
while true; do
    play_sound
    sleep 1
done
