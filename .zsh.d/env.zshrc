export EDITOR="emacsclient -t"

# golang
export GOPATH="$HOME/.go"
PATH="$GOPATH"/bin:"$PATH"

# init boot2docker
if type boot2docker > /dev/null; then
  eval "$(boot2docker shellinit 2> /dev/null)"
fi
