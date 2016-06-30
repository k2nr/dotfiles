if type tac > /dev/null; then
  reverse_command=tac
else
  reverse_command="tail -r"
fi

function peco_select_history() {
    BUFFER=$(fc -l -n 1 | eval $reverse_command | peco)
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N peco_select_history
bindkey '^R' peco_select_history

function peco_select_directory() {
    local dest="$(_z -r 2>&1 | awk '{ $1=""; gsub (/^ */,"",$0); print $0 }' | eval $reverse_command | peco)"
    if [ -n "${dest}" ]; then
        cd "${dest}"
    fi
    zle reset-prompt
}
zle -N peco_select_directory
bindkey '^J' peco_select_directory

function peco_git_checkout() {
    local dest=$(git branch | awk '{gsub (/^[* ]*/,"",$0); print $0}' | peco)
    git checkout $dest
}
