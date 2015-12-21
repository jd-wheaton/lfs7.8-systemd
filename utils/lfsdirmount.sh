#!/bin/bash
#######################################################################
# lfsdirmount.sh
# - Create LFS directories and mount partitions
# - You must add actual work commands, for safety data just echo'd
####################################################################### 
export LFS=/path/to/lfs
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
DIRS=( $LFS $LFS/home $LFS/usr $LFS/opt $LFS/tmp )
PARTS=( /dev/sdc3 /dev/sdc4 /dev/sdc5 /dev/sdc6 /dev/sdc7 )
echo
echo Starting $SCRIPT...
echo
echo Creating directories...
for ((i=0; i<${#DIRS[@]}; i++)); do echo creating "${DIRS[$i]}"; done
echo
echo Mounting partitions...
for ((i=0; i<${#DIRS[@]}; i++)); do echo "${PARTS[$i]}" "${DIRS[$i]}"; done
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
