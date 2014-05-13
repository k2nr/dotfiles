# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

[ -f ${HOME}/.zsh.d/aliases.zshrc ] && source ${HOME}/.zsh.d/aliases.zshrc

export EDITOR="mvim -v"

# to use japanese on swank
export JAVA_OPTS="-Dswank.encoding=utf-8-unix"

export GOPATH="$HOME/.go"

path=(. $HOME/bin $HOME/.cask/bin $HOME/Library/Haskell/bin /usr/local/share/npm/bin /usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin )

autoload -U select-word-style
select-word-style bash

export GREP_OPTIONS="--color=auto --binary-files=without-match"

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
    '%{%F{yellow}%}(%b)%{%f%}'

pro_cur_dir="%{%F{yellow}%}[%~]"
pro_user="%{%F{cyan}%}%n@%m"
pro_time="%{%F{cyan}%}<%D{%Y/%m/%d %H:%M:%S}>"
update_prompt() {
    # バージョン管理システムの情報を取得する。
    LANG=C vcs_info >&/dev/null
    # バージョン管理システムの情報があったらプロンプトに表示する。
    if [ -n "$vcs_info_msg_0_" ]; then
        pro_vcs="${vcs_info_msg_0_}"
    else
        pro_vcs=""
    fi

    PROMPT="${pro_cur_dir}${pro_user} ${pro_time} ${pro_vcs}"$'\n'"%{%f%}%# "
}
#RPROMPT="${pro_vcs}"

precmd_functions=($precmd_functions update_prompt)

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

# boot2docker
export DOCKER_HOST=tcp://localhost:4243
