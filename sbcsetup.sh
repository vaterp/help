cd ~/SBC
sudo mount --bind /dev ./dev
sudo mount --bind /proc ./proc
sudo mount --bind /sys ./sys
cd ..
sudo chroot SBC
