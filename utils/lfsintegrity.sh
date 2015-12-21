#!/bin/bash
#######################################################################
# lfsintegrity.sh
# - Check integrity of LFS source and patch files
#######################################################################
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo Starting...
pushd $LFS/sources
md5sum -c $SCRIPTPATH/md5sums
popd $LFS/sources
