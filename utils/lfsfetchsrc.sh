#!/bin/bash
#######################################################################
# lfsfetchsrc.sh
# - Download LFS source and patches
#######################################################################
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo
echo Starting $SCRIPT...
echo
wget --input-file=$SCRIPTPATH/src.list --continue --directory-prefix=$LFS/sources
echo
echo Done!
