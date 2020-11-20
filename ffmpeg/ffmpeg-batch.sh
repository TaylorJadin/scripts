for i in *.opus; do ffmpeg -i "$i" "${i%.*}.mp3"; done
