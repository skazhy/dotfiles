#!/bin/bash

# A super simple version of the "get-shit-done" thing.
#
# To load blacklist correctly, this needs to be aliased
# Through sudo and the location of dotfiles dir as the
# first argument.

hosts_file="/etc/hosts"
hosts_bak="/etc/hosts.bak"


function work() {
  if grep "## getting shit done" $hosts_file &> /dev/null; then
    exit 1
  fi

  source $1/Zsh/get-shit-done/blacklist.sh

  cp $hosts_file $hosts_bak

  echo "## getting shit done" >> $hosts_file

  for site in "${GSD_BLACKLIST[@]}"
  do
    echo "127.0.0.1 $site" >> $hosts_file
    echo "127.0.0.1 www.$site" >> $hosts_file
  done
}


function play() {
  mv $hosts_bak $hosts_file
}


case "$2" in
    "work") work $1 ;;
    "play") play ;;
    *) echo "usage: getshitdone [work|play]" ;;
esac
