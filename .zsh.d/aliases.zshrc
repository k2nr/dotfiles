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
alias zshconf="vi ~/.zsh.d/my.zshrc"
alias less="less -N -M"
alias ack="ack --nogroup"
alias ag="ag --nogroup"
alias src="source ~/.zshrc"
alias bu="brew update && brew upgrade"
alias vag="vagrant"
alias ff="ffind"
alias psg="ps auxw | grep"

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
