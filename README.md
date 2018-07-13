# Dotfiles

My neat collection of dotfiles.

Batch install / update for all resources can be done via rake:

*    `rake install`: to symlink & install all the dotfiles to $HOME
*    `rake update`: to update all resources (submodules, etc)

Install / update for selected parts is possible, too.

*    `rake install:vim`
*    `rake update:vim`

Installing dotfiles will add minimal set that works on all *NIX systems. To
add specific extensions for each OS, use `patch`. Currently there are specific
extensions for `macos` and `openbsd`. (ie, `rake patch:macos`).

## Requirements

Currently running on time-tested software:

* tmux 2.7
* vim 8.1
* zsh 5.3

___

2011 - &infin; [skazhy](http://karlis.me)
