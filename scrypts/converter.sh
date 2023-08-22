#! /bin/bash
find . -name "*.flac" -exec ffmpeg -i {} -ab 320k -filter:a "volume=3.0" -map_metadata 0 -id3v2_version 3 {}.mp3 \;
