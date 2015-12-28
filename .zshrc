[ -f ${HOME}/.zsh.d/common.zshrc ] && source ${HOME}/.zsh.d/common.zshrc
[ -f ${HOME}/.zsh.d/my.zshrc ] && source ${HOME}/.zsh.d/my.zshrc

eval `opam config env`
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
