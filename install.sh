#! /bin/sh

DDIR=$(cd $(dirname "$0"); pwd)

# Bash
  ln -fs $DDIR/bashrc ~/.bashrc

# Fonts
  curl -so $DDIR/Fonts/mensch.ttf http://robey.lag.net/downloads/mensch.ttf
  ln -fs $DDIR/Fonts ~/.fonts

# Git
  ln -fs $PWD/Git/gitconfig ~/.gitconfig
  ln -fs $PWD/Git/gitignore ~/.gitignore.global
  
  cd $DDIR
  git submodule update --init

# Openbox
  echo "Using Openbox? (only y is affirmitive)"
  read ob
  if [ "$ob" = "y" ]; then
      ln -fs $DDIR/Openbox/xinitrc ~/.xinitrc
      ln -fs $DDIR/Openbox/xbindkeysrc.scm ~/.xbindkeysrc.scm
      if [ ! -d ~/.config/ ]; then
        mkdir ~/.config
      fi
      ln -fs $DDIR/Openbox ~/.config/openbox
  fi

# Ruby
  ln -fs $DDIR/gemrc ~/.gemrc

# Xmodmap
  ln -fs $DDIR/Xmodmap ~/.Xmodmap
  
# Vim
  curl -so $DDIR/Vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
  
  curl -so $DDIR/Vim/colors/solarized.vim \
    https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
  curl -so $DDIR/Vim/colors/pyte.vim \
    https://raw.github.com/vim-scripts/pyte/master/colors/pyte.vim
  curl -so $DDIR/Vim/colors/mayansmoke.vim \
    https://raw.github.com/vim-scripts/mayansmoke/master/colors/mayansmoke.vim
  curl -so $DDIR/Vim/colors/moria.vim \
    https://raw.github.com/vim-scripts/moria/master/colors/moria.vim

  ln -fs $DDIR/Vim/vimrc ~/.vimrc
  ln -fs $DDIR/Vim ~/.vim

# Zsh
  ln -fs $DDIR/zshrc ~/.zshrc
