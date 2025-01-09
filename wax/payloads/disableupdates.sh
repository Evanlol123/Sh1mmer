#!/bin/sh
. usr/local/CUT/common.sh
clear
logo

echo "This script will remove the secondary kernel and rootfs utilized for ChromeOS' update mechanism"
echo "You will not be able to undo this without restoring with a recovery USB"
echo "Press enter to continue, ctrl+C to cancel"
read a
cgpt add /dev/mmcblk0 -i 2 -P 10 -T 5 -S 1 && yes | mkfs.ext4 /dev/mmcblk0p1 && fdisk /dev/mmcblk0 <<< -e 'd\n4\nd\n5\nw'
echo "Success! Your Chromebook can now no longer update"
