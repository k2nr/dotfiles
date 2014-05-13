# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

alias git="noglob hub"
alias rake="noglob rake"

### aliases
alias lla="ls -la"
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias e="emacsclient -n"
alias enw="emacsclient -nw"
alias o="open"
alias rmr="rm -rf"
alias vim="mvim -v"
alias vi="vim"
alias v="vim"
alias tmux="TERM=screen-256color-bce tmux"
alias viconf="vi ~/.vimrc"
alias zshconf="vi ~/.zshrc.mine"
alias less="less -N -M"
alias ack="ack --nogroup"
alias a="ack"
alias src="source ~/.zshrc"
alias bu="brew update && brew upgrade"
alias vag="vagrant"
alias ff="ffind"

## git aliases
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gs="git status"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias git-current-branch="git symbolic-ref --short HEAD | tr -d '\r\n'"
alias gc="git commit"
alias gcb="git-current-branch"
alias gp="git push -u"
alias gpl="git pull"
alias gdc="git diff --cached"
alias gdvc="gdv --cached"
alias gl="git log --pretty=format:'%Cred%h%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset'"
alias gst="git stash save"
alias gstl="git stash list"
alias gstc="git stash clear"
alias gstp="git stash pop"
alias gready="git rebase -i @{u}"
alias gsync="gst && gpl && gstp"
alias gn="git now"
alias gnc="git now --compact"
alias gnd="git now --diff"
alias gnr="git now --rebase"
alias gnf="git now --fixup"

alias gco="git checkout"
alias gcm="git checkout master"
alias grhh="git reset --hard HEAD"
compdef _git gco=_git-checkout

## hub aliases

# merge pull-request with pull-request number
# USAGE: gmpr 1
gmpr() {
  git merge `git config --get remote.origin.url | sed -e 's/\.git//'`/pull/$1
}

gbrp() {
  open `git config --get remote.origin.url | sed -e 's/\.git//'`/pull/$1
}

alias gpr="git pull-request"
alias gbr="git browse"

alias be="bundle exec"
alias t="tig"
alias ts="tig status"

alias r="rake"

# global aliases
alias -g L="|less"
alias -g G="|grep"
alias -g H="|head"
alias -g T="|tail"
alias -g XG="|xargs grep -Hn"
alias -g XG0="|xargs -0 grep -Hn"
alias -g C="|pbcopy"
alias -g P="pbpaste|"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

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