git clone --recurse-submodules https://github.com/bad-apple-lab/Bad-Apple.git
cd Bad-Apple
sudo pacman -S ffmpeg
g++ badapple-ffmpeg.cpp -o badapple -lavformat -lavcodec -lavutil -lswscale -O2
sudo pacman -S yt-dlp ffmpeg
yt-dlp -f mp4 "https://www.youtube.com/watch?v=FtutLA63Cp8" -o badapple.mp4
ffmpeg -i badapple.mp4 -q:a 0 -map a badapple.mp3
tee ~/.local/bin/ba << 'EOF'
#!/bin/zsh
cd ~/Bad-Apple || exit
./badapple -i badapple.mp4 -a badapple.mp3 -r 60
EOF
chmod +x ~/.local/bin/ba
