alias git="noglob hub"
alias rake="noglob rake"
alias grep="grep --color=auto --binary-files=without-match"

### aliases
alias lla="ls -la"

if [[ $OSTYPE == darwin* ]]; then
  alias emacs="open /Applications/Emacs.app"
  alias vim="mvim -v"
  alias bu="brew update && brew upgrade"
  alias o="open"
fi

alias e="emacsclient -n"
alias ee="emacsclient -t"
alias rmr="rm -rf"
alias vi="vim"
alias v="vim"
alias tmux="TERM=screen-256color-bce tmux"
alias viconf="vi ~/.vimrc"
alias zshconf="vi ~/.zsh.d/my.zshrc"
alias less="less -N -M"
alias ack="ack --nogroup"
alias ag="ag --nogroup"
alias src="source ~/.zshrc"
alias vag="vagrant"
alias ff="ffind"
alias b2d="boot2docker"
alias d="docker"

mcd() {
  mkdir -p $1 && cd $1
}

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
alias gl="git log --pretty=format:'%Cred%h%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset'"
alias gst="git stash save"
alias gstl="git stash list"
alias gstc="git stash clear"
alias gstp="git stash pop"
alias gn="git now"
alias gnc="git now --compact"
alias gnd="git now --diff"
alias gnr="git now --rebase"
alias gnf="git now --fixup"

#alias gco="git checkout"
gco() {
  if [[ -z $1 ]]; then
    peco_git_checkout
  else
    git checkout $@
  fi
}

alias gcm="git checkout master"
alias grhh="git reset --hard HEAD"

## hub aliases

# merge pull-request with pull-request number
# USAGE: gmpr 1
gmpr() {
  git merge `git config --get remote.origin.url | sed -e 's/\.git//'`/pull/$1
}

gbrp() {
  open `git config --get remote.origin.url | sed -e 's/\.git//'`/pull/$1
}

hub-merge-am() {
  hub am -3 "https://github.com/$1/pull/$2"
  NEWLINE=$'\n'
  git commit --amend -m "$(git log -1 --pretty=%B)${NEWLINE}${NEWLINE}Closes #$2"
}

hub-sync-master() {
  git fetch $1 -p && git checkout master && git merge $1/master --ff-only
}

alias ha="hub-merge-am"

alias gpr="git pull-request"
alias gbr="git browse"

alias be="bundle exec"
alias t="tig"
alias ts="tig status"

alias r="rake"
alias re="rbenv"

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
