if $(type "npm" &> /dev/null); then
    export PATH="$(npm prefix -g)/bin:$PATH"
fi
