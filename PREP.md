Final Preparations
==================

Created a script to accomplish the Part II Chapter 4 objectives

```
./utils/lfstoolenv.sh
```

Objectives (for reference)
--------------------------

2.4.2 - Create $LFS/tools directory as root
```
mkdir -pv $LFS/tools
```

2.4.3 - Create a host symbolic link to $LFS/tools as root
```
ln -sv $LFS/tools /
```

Adding an unpriviledged user for compiling source and grant full access to tools and source 
```
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
```

2.4.4 - Setup the environment

Create a new .bash_profile and .bashrc for new lfs user
```
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF
```
```
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF
```

https://github.com/jd-wheaton/lfs7.8-systemd
