sudo mount --bind ~/.config/keybase keybaseconfig
docker build -t zegerhoogeboom/keybase .
sudo umount keybaseconfig