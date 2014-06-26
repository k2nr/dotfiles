function peco_select_history() {
    BUFFER=$(fc -l -n 1 | tail -r | peco --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
zle -N peco_select_history
bindkey '^R' peco_select_history

function peco_select_directory() {
    local dest="$(_z -r 2>&1 | awk '{ $1=""; gsub (/^ */,"",$0); print $0 }' | tail -r | peco)"
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