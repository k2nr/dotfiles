if [[ $OSTYPE == darwin* ]]; then
  # zsh-completions
  fpath=(/usr/local/share/zsh-completions $fpath)

  path=(/usr/local/bin /usr/sbin /usr/bin /sbin /bin )
fi

[ -f ${HOME}/.zsh.d/env.zshrc ] && source ${HOME}/.zsh.d/env.zshrc

autoload -U select-word-style
select-word-style bash

for f in $HOME/.zsh.d/init/*
do
  if [[ -f $f ]]; then
    source $f
  fi
done

[ -f ${HOME}/.zsh.d/aliases.zshrc ] && source ${HOME}/.zsh.d/aliases.zshrc
[ -f ${HOME}/.zsh.d/prompt.zshrc ] && source ${HOME}/.zsh.d/prompt.zshrc

export PATH=$HOME/bin:$HOME/opt/bin:$HOME/.local/bin:$PATH

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    [[ ${#line} -ge 5 ]]
}
