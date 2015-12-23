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
  echo    \| - Create lfs mount points and mount accordingly
  echo    +-------------------------------------------------------------------------------
  echo
  prompt_confirm "Continue?" || exit 0
  echo
  export LFS=/path/to/lfs
  points=( $LFS $LFS/home $LFS/usr $LFS/opt $LFS/tmp )
  parts=( /dev/sdc3 /dev/sdc4 /dev/sdc5 /dev/sdc6 /dev/sdc7 )
  echo Creating top level mount points... 
  for ((i=0; i<${#points[@]}; i++)); do mkdir -pv "${points[$i]}"; done
  echo
  echo Mounting top level partitions...
  for ((i=0; i<${#points[@]}; i++)); do mount -v "${parts[$i]}" "${points[$i]}"; done
  echo
  echo Creating nested mount points...
  mkdir -pv $LFS/boot/efi
  mkdir -pv $LFS/usr/src
  echo
  echo Mounting nested partitions...
  mount -v /dev/sdc1 $LFS/boot/efi
  mount -v /dev/sdc8 $LFS/usr/src
  echo
  echo Done!
fi 
