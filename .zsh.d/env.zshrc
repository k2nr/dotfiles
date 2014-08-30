export EDITOR="mvim -v"

# grep options
export GREP_OPTIONS="--color=auto --binary-files=without-match"

# to use japanese on swank
export JAVA_OPTS="-Dswank.encoding=utf-8-unix"

# golang
export GOPATH="$HOME/.go"

PATH="$GOPATH"/bin:"$PATH"

# docker for OSX
export DOCKER_HOST=tcp://192.168.59.103:2375
