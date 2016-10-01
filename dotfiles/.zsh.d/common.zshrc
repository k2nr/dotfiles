# users generic .zshrc file for zsh(1)

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

# no beep sound
#
setopt nobeep

## Command history configuration
#
HISTFILE=${HOME}/.zsh.d/history
HISTSIZE=500000
SAVEHIST=500000
setopt hist_ignore_dups     # ignore duplication command history list
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history        # share command history data
setopt inc_append_history
setopt extended_history


## Completion configuration
autoload -U compinit
compinit

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -CFG -h"
    ;;
linux*)
    alias ls="ls --color -h"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

