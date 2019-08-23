#!/bin/bash
echo $1
youtube-dl --extract-audio --audio-format mp3 -citw $1
filename=`youtube-dl --get-filename $1`
find='.mp4'
replace='.mp3'
filename=${filename//$find/$replace}
find='.webm'
replace='.mp3'
filename=${filename//$find/$replace}
find='.mkv'
replace='.mp3'
filename=${filename//$find/$replace}
echo $filename
ffmpeg -i "$filename" -ss 00:$2 -t 00:$3 -async 1 "cut-$filename"
rm "$filename"
mv "cut-$filename" "$filename"
