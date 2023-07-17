# How to create and clone images for Raspberry Pi

1. Use Raspberry Pi to install operating system and configure it in needed way
2. Take SD card and delete /var/lib/salt/pki/minion/* (it will delete all public and private keys of master and minion)
3. Take Rasberry Pi SD card and make an image of the card: `dd if=/dev/sda of=pinot-image-name.img`.
    - `/dev/diskX` could be different for your system
    - Default image name template: `pinot-<version>-<target>-<architecture>.img`. Use SemVer for versioning.
    - Example: `pinot-0.3.1-raspi-arm64.img`
4. Use [PiShrink](https://github.com/Drewsif/PiShrink) to shrink your image. It will reduce image size from whole SD card size (e.g., 32 or 128 GB) to size of files inside (typically about 4GB). After image would be written to SD card and booted up, it will auto-expand.
    - Example: `./pishrink.sh pinot-0.2.1-raspi-arm64.img pinot-0.3.1-raspi-arm64-shrinked.img`
    - Optional: calculate sha256sum of the resulting image and store it in the repo
5. Write image to a new SD card: `sudo dd if=pinot-0.2.1-raspi-arm64-compressed.img of=/dev/disk2 bs=4M status=progress`
    - `/dev/diskX` could be different for your system
