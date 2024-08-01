source ~/.ghcup/env

# Switching between profiles in iTerm2

function setbg() {
  echo -e "\033]50;SetProfile=$1\a"
}

alias plainemacs="emacs --init-directory $DOTFILES_DIR/Emacs/plain"
alias doomemacs="emacs --init-directory ~/.emacs.d"
