#! /bin/bash
find . -name "*.flac" -exec ffmpeg -i {} -b:a 320k -filter:a "volume=1.1" -map_metadata -id3v2_version 3 {}.mp3 \;
