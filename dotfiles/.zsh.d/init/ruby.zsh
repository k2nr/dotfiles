if $(type "rbenv" &> /dev/null); then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
elif $(type "ruby" &> /dev/null); then
    export GEM_HOME=$HOME/.gems/`ruby -e 'puts RUBY_VERSION'`
    export PATH="$GEM_HOME/bin:$PATH"
fi
