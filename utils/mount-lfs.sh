#!/bin/sh
echo Setting up LFS mounts
sudo swapon -v /dev/sdc2
sudo mount -v -t ext4 /dev/sdc3 $LFS
sudo mount -v -t ext4 /dev/sdc4 $LFS/home
sudo mount -v -t ext4 /dev/sdc5 $LFS/usr
sudo mount -v -t ext4 /dev/sdc6 $LFS/opt
sudo mount -v -t ext4 /dev/sdc7 $LFS/tmp
sudo mount -v -t ext4 /dev/sdc8 $LFS/usr/src
