# Dotfiles

My neat collection of dotfiles.

Batch install / update for all resources can be done via rake:

*    `rake install`: to symlink & install all the dotfiles to $HOME
*    `rake update`: to update all resources (submodules, etc)

I've added `rake update` in a post-merge hook, for fun and profit.
Install / update for selected parts is possible too.

*    `rake install:vim`
*    `rake update:vim` 
