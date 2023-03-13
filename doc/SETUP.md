# Setup instructions

Last tested on fresh instance of macOS Ventura 13.2.1.

* Install [Homebrew](https://brew.sh/)
    * Follow instructions in "next steps" after installation
* Install [iTerm2](https://iterm2.com/)
    * In "Profile > Keys" select "Natural Text Editing" from presets
    * IN "Profile > "Colors" select "Solarized Dark" from color presets
* Install tmux `brew install tmux`
* Install Fira Code font by following [this guide](https://github.com/tonsky/FiraCode/wiki/Installing#macos)
* Install Doom Emacs by following [this guide](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#on-macos)
    * Use `emacs-mac` formula option
* Install MacVim via `brew install macvim`
* Install FZF via `brew install fzf`
    * Follow post-install instructions on Vim integration
* Run `rake install` from the root of the repo to setup all dotfiles
