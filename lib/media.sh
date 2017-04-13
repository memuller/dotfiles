#!/bin/bash

# converts all files following given pattern to MP3
# uses FFPEG, VBR high-quality
# parameter is the pattern or file name; "*.flac" if ommited
function convertMP3() {
  if [ $# -eq 0 ]; then
    pattern=(*.flac)
  else
    pattern=($1)
  fi
  for f in $pattern; do
    echo "$f"
    ffmpeg -i "$f" -q:a 0 "${f%.*}.mp3"
  done
}
