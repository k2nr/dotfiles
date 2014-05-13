# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

[ -f ${HOME}/.zsh.d/aliases.zshrc ] && source ${HOME}/.zsh.d/aliases.zshrc
[ -f ${HOME}/.zsh.d/prompt.zshrc ] && source ${HOME}/.zsh.d/prompt.zshrc
[ -f ${HOME}/.zsh.d/env.zshrc ] && source ${HOME}/.zsh.d/env.zshrc
path=(. $HOME/bin $HOME/.cask/bin $HOME/Library/Haskell/bin /usr/local/share/npm/bin /usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin )

autoload -U select-word-style
select-word-style bash

# rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# rvm
PATH="$HOME"/.rvm/bin:"$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
cd;cd - > /dev/null

## z
. `brew --prefix`/etc/profile.d/z.sh

## tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
