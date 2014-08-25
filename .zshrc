[ -f ${HOME}/.zsh.d/common.zshrc ] && source ${HOME}/.zsh.d/common.zshrc
[ -f ${HOME}/.zsh.d/my.zshrc ] && source ${HOME}/.zsh.d/my.zshrc

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

eval `opam config env`
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
