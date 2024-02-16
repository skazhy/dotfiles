source ~/.ghcup/env

# Switching between profiles in iTerm2

function setbg() {
  echo -e "\033]50;SetProfile=$1\a"
}

alias plainemacs="/opt/homebrew/Cellar/emacs-mac/emacs-29.1-mac-10.0/Emacs.app/Contents/MacOS/Emacs --init-directory $DOTFILES_DIR/Emacs/plain"
alias doomemacs="/opt/homebrew/Cellar/emacs-mac/emacs-29.1-mac-10.0/Emacs.app/Contents/MacOS/Emacs"
