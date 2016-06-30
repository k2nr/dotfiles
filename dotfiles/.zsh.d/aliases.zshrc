alias rake="noglob rake"
alias grep="grep --color=auto --binary-files=without-match"

### aliases
alias lla="ls -la"

if [[ $OSTYPE == darwin* ]]; then
  alias emacs="open /Applications/Emacs.app"
#  alias vim="mvim -v"
  alias bi="brew install"
  alias bs="brew search"
  alias bci="brew cask install"
  alias bcs="brew cask search"
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
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"

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
if $(type "hub" &> /dev/null); then
  alias git="noglob hub"

  alias gpr="git pull-request"
  alias gbr="git browse"
fi

alias be="bundle exec"
alias t="tig"
alias ts="tig status"

alias r="rake"
alias re="rbenv"
alias ree="rbenv exec"

alias ne='PATH=node_modules/.bin:$PATH'

# global aliases
alias -g L="|less"
alias -g G="|grep"
alias -g H="|head"
alias -g T="|tail"
alias -g XG="|xargs grep -Hn"
alias -g XG0="|xargs -0 grep -Hn"

if [[ $OSTYPE == darwin* ]]; then
  alias -g C="|pbcopy"
  alias -g P="pbpaste|"
fi

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
