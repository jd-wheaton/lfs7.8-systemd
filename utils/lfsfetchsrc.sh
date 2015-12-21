#!/bin/bash
#######################################################################
# lfsfetchsrc.sh
# - Download LFS source and patches
#######################################################################
wget --input-file=src.list --continue --directory-prefix=$LFS/sources
