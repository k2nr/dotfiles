if $(type "ruby" &> /dev/null); then
    export GEM_HOME=$HOME/.gems/`ruby -e 'puts RUBY_VERSION'`
    export PATH="$GEM_HOME/bin:$PATH"
fi
