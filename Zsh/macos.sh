source ~/.ghcup/env

# Switching between profiles in iTerm2

function setbg() {
  echo -e "\033]50;SetProfile=$1\a"
}
