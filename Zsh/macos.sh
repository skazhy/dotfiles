# Switching between JDK versions, works on OS X only.

export PATH=$PATH:~/Library/Haskell/bin

# Switching between profiles in iTerm2

function setbg() {
  echo -e "\033]50;SetProfile=$1\a"
}
