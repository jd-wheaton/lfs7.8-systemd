#!/bin/bash
prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}
if [[ $EUID -ne 0 ]]; then
  echo "Script requires root" 2>&1
  exit 1
else
  SCRIPT=$(readlink -f "$0")
  SCRIPTPATH=$(dirname "$SCRIPT")
  echo
  echo    +-------------------------------------------------------------------------------
  echo    \| Running $SCRIPT...
  echo    \| - Chroot into the lfs build environment
  echo    +-------------------------------------------------------------------------------
  echo
  prompt_confirm "Continue?" || exit 0
  echo
  chroot "$LFS" /tools/bin/env -i                 \
    HOME=/root                                    \
    TERM="$TERM"                                  \
    MAKEFLAGS='-j 8'                              \
    PS1='\u:\w\$ '                                \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h
  echo
  echo Done!
fi 
