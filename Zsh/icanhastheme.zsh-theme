# I Can Has Theme
# ...because all other themes are not cool.
#
# TODO:
# Show gemset if not using system Ruby $(rvm-prompt)
# Should style virtualenv too

PROMPT='%c $(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}+%{$reset_color%}"
