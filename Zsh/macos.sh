# Switching between JDK versions, works on OS X only.

function setjdk() {
  function removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
  }

  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME/bin
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
}

setjdk 1.8

export PATH=$PATH:~/Library/Haskell/bin

# Switching between profiles in iTerm2

function setbg() {
  echo -e "\033]50;SetProfile=$1\a"
}
