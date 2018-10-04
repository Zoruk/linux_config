#!/bin/bash

sudo add-apt-repository ppa:qos/pulseaudio-dlna
sudo apt-get update
sudo apt-get install pulseaudio-dlna ffmpeg

# Run for chromecast audio
# pulseaudio-dlna --codec mp3 --encoder-backend=ffmpeg
