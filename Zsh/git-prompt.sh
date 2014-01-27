# Modify the colors and symbols in these variables as desired.

GIT_PROMPT_AHEAD="%{$fg[red]%}+NUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}-NUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}mr%{$reset_color%}"

parse_git_location() {
  (git symbolic-ref HEAD || git rev-parse --short HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE"m"
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE"s"
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_STATE:"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_location="$(parse_git_location)"
  [ -n "$git_location" ] && echo "$(parse_git_state)%{$fg[yellow]%}${git_location#(refs/heads/|tags/)}%{$reset_color%} "
}
