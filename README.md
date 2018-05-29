# Dotfiles

My neat collection of dotfiles.

Batch install / update for all resources can be done via rake:

*    `rake install`: to symlink & install all the dotfiles to $HOME
*    `rake update`: to update all resources (submodules, etc)

I've added `rake update` in a post-merge hook, for fun and profit.
Install / update for selected parts is possible too.

*    `rake install:vim`
*    `rake update:vim`


Installing dotfiles will add minimal set that works onall *NIX systems. To
add specific extensions for each OS, use `patch`. Eg, for OpenBSD - `rake
patch:openbsd`.

## Requirements

Currently running on time-tested software:

* tmux 2.7
* vim 7.4
* zsh 5.2

___

2011 - &infin; [skazhy](http://karlis.me)
