#!/bin/bash
# Glichting screen lock script by xzvf

pngfile="/tmp/sclock.png"
bmpfile="/tmp/sclock.bmp"
glitchedfile="/tmp/sclock_g.bmp"
scrot -z $pngfile

magick convert -rotate -90 $pngfile $bmpfile

for a in {1,2,4,5,10}
do

    sox -t ul -c 1 -r 48k $bmpfile -t ul $glitchedfile trim 0 90s : echo 1 1 $((a*2)) 0.1

    magick convert -scale $((100/(a)))% -scale $((100*(a)))% -rotate 90 $glitchedfile $bmpfile
done

magick convert -gravity center -font "Monoid" \
    -pointsize 200 -draw "text 0,0 'LOCKED'" -channel RGBA -fill '#bf616a' \
    $bmpfile $pngfile

i3lock -e -u -i $pngfile
rm $pngfile $bmpfile $glitchedfile
