Storage
=======

/dev/sdc will be allocated to storing this lfs project

0. Currently hosting a Windows 10 installation
0. Existing partitions will be eliminated
0. New allocations will be based on Part II Chapter 2 of guide

Current
-------
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
