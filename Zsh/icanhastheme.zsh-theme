# I Can Has Theme
# (copyleft) skazhy / 2013
#
# ...because all other themes are not cool.
# No crazy characters that mess up tmux, no multiline madness


function pwd_prompt {
    echo $(basename $PWD)
}

function virtualenv_prompt {
    [ $VIRTUAL_ENV ] && echo " %{$fg[green]%}"`basename $(dirname $VIRTUAL_ENV)`"%{$reset_color%}"
}

function rvm_prompt {
    [ $GEM_HOME ] && echo " %{$fg[blue]%}"`rvm-prompt`"%{$reset_color%}"
}


PROMPT='$(pwd_prompt)$(git_prompt_info)%{$reset_color%}$(virtualenv_prompt)$(rvm_prompt) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}+%{$reset_color%}"
