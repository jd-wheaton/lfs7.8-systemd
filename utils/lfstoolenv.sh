#!/bin/bash
#######################################################################
# lfstoolenv.sh
# - Create tools directory and unpriviledged user for compiling source
#######################################################################
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo
echo Starting $SCRIPT...
echo
mkdir -pv $LFS/tools
ln -sv $LFS/tools /
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
echo Creating .bash_profile and .bashrc for lfs...
su - lfs <<EOF
echo exec env -i HOME=/home/lfs TERM=$TERM PS1="'\u:\w\$ '" /bin/bash > ~/.bash_profile
echo set +h > ~/.bashrc
echo umask 022 >> ~/.bashrc
echo LFS=/media/build/lfs >> ~/.bashrc
echo LC_ALL=POSIX >> ~/.bashrc
echo LFS_TGT=$(uname -m)-lfs-linux-gnu >> ~/.bashrc
echo PATH=/tools/bin:/bin:/usr/bin >> ~/.bashrc
echo export LFS LC_ALL LFS_TGT PATH >> ~/.bashrc
EOF
echo
echo Done!
