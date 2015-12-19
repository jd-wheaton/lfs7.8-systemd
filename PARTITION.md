Partitioning
============

/dev/sdc will be hijacked for storage 

0. Is currently hosting a Windows 10 install
0. Existing partitions eliminated
0. New allocations based on guide section 2.2

Buh-bye Windows 10
------------------
```
build@lfs:~# parted /dev/sdc
GNU Parted 2.3
Using /dev/sdc
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) print                                                            
Model: ATA Samsung SSD 850 (scsi)
Disk /dev/sdc: 1024GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt

Number  Start   End     Size    File system  Name                          Flags
 1      1049kB  630MB   629MB   ntfs         Basic data partition          hidden, diag
 2      630MB   945MB   315MB   fat32        EFI system partition          boot
 3      945MB   1079MB  134MB                Microsoft reserved partition  msftres
 4      1079MB  605GB   604GB   ntfs         Basic data partition          msftdata
 5      605GB   605GB   472MB   ntfs                                       hidden, diag
 6      605GB   1008GB  403GB   ntfs         Basic data partition          msftdata
 7      1008GB  1024GB  16.2GB  ntfs         Basic data partition          hidden, diag
```

Storage Prep 2.2
----------------
Partitions removed
```
(parted) print                                                            
Model: ATA Samsung SSD 850 (scsi)
Disk /dev/sdc: 1024GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt

Number  Start  End  Size  File system  Name  Flags

(parted)
```
- *[2.2.1.1] Elaborates 10GB is adequate for most LFS+BLFS "/" (~)20GB should be safe
- *[2.2.1.2] Swap (~)8GB
- *[2.2.1.3] /boot = (~)512MB, /home = (~)50GB, /usr = (~)5GB, /opt = (~)10GB, /tmp = (~)2GB, /usr/src = (~)50GB

File Systems 2.3
----------------
0. /boot = /dev/sdc1 @512MB formatted fat32
0. swap = /dev/sdc2 @8GB
0. / = /dev/sdc3 @20GB formatted ext4
0. /home = /dev/sdc4 @50GB formatted ext4
0. /usr = /dev/sdc5 @5GB formatted ext4
0. /opt = /dev/sdc6 @10GB formatted ext4
0. /tmp = /dev/sdc7 @2GB formatted ext4
0. /usr/src = /dev/sdc8 @50GB formatted ext4

```
build@lfs:/root# parted /dev/sdc
GNU Parted 2.3
Using /dev/sdc
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) print                                                            
Model: ATA Samsung SSD 850 (scsi)
Disk /dev/sdc: 1024GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt

Number  Start   End     Size    File system     Name        Flags
 1      1049kB  538MB   537MB   fat32           EFI System  boot
 2      538MB   8590MB  8052MB  linux-swap(v1)  Linux Swap
 3      8590MB  30.1GB  21.5GB  ext4            root
 4      30.1GB  85.9GB  55.8GB  ext4            home
 5      85.9GB  91.3GB  5369MB  ext4            usr
 6      91.3GB  102GB   10.7GB  ext4            opt
 7      102GB   104GB   2147MB  ext4            tmp
 8      104GB   169GB   64.4GB  ext4            src
```
Set $LFS variable 2.4
---------------------
- Adding to ~/.bashrc && /root/.bashrc
```
export LFS=/media/build/lfs
```
Mounting up $LFS 2.5
--------------------
- Made two terrible scripts to create mount points and mount $LFS
- Needs to be consolidated into a single script with if exist (todo) 
```
./utils/make-lfs-dirs.sh
./utils/mount-lfs.sh
```

