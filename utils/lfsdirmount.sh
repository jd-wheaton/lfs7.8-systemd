#!/bin/bash
#######################################################################
# lfsdirmount.sh
# - Create LFS directories and mount partitions
# - You must add actual work commands, for safety data just echo'd
####################################################################### 
export LFS=/path/to/lfs

dirs=( $LFS $LFS/home $LFS/usr $LFS/opt $LFS/tmp )
parts=( /dev/sdc3 /dev/sdc4 /dev/sdc5 /dev/sdc6 /dev/sdc7 )

echo
echo Creating directories...
for ((i=0; i<${#dirs[@]}; i++)); do echo creating "${dirs[$i]}"; done
echo
echo Mounting partitions...
for ((i=0; i<${#dirs[@]}; i++)); do echo "${parts[$i]}" "${dirs[$i]}"; done
echo
echo Creating nested directories...
echo Creating $LFS/boot/efi
echo Creating $LFS/usr/src
echo
echo Mounting nested partitions... 
echo /dev/sdc1 $LFS/boot/efi
echo /dev/sdc8 $LFS/usr/src
echo
echo Done!
