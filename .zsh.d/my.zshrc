# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

path=(. $HOME/.nimble/bin $HOME/bin $HOME/.cask/bin /usr/local/share/npm/bin /usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin )

if [[ $OSTYPE == darwin* ]]; then
  PATH=$HOME/Library/Haskell/bin:$PATH
fi

[ -f ${HOME}/.zsh.d/aliases.zshrc ] && source ${HOME}/.zsh.d/aliases.zshrc
[ -f ${HOME}/.zsh.d/prompt.zshrc ] && source ${HOME}/.zsh.d/prompt.zshrc
[ -f ${HOME}/.zsh.d/env.zshrc ] && source ${HOME}/.zsh.d/env.zshrc

autoload -U select-word-style
select-word-style bash

for f in $HOME/.zsh.d/init/*
do
  if [[ -f $f ]]; then
    source $f
  fi
done
