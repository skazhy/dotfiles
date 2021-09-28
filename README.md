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

* tmux 3.2a
* vim 8.1
* zsh 5.3

### Vim

FZF and ripgrep are required: `brew install fzf ripgrep`. I am using
[FiraCode](https://github.com/tonsky/FiraCode) in the non-terminal Vim. I use the
following Vim plugins (managed with git submodules + native Vim 8 package
manager)

* [emmet (née zencoding)](https://vimawesome.com/plugin/emmet-vim)
* [fireplace](https://vimawesome.com/plugin/vim-fireplace)
* [fugitive](https://vimawesome.com/plugin/fugitive-vim)
* [NERDTree](https://vimawesome.com/plugin/nerdtree-red)
* [SnipMate](https://vimawesome.com/plugin/vim-snipmate-mine)
* [surround](https://vimawesome.com/plugin/surround-vim)

___

2011 - &infin; [skazhy](http://karlis.me)
