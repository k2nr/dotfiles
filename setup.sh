#!/bin/bash

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew bundle

# Go Packages
go get -u github.com/nsf/gocode
go get -u code.google.com/p/rog-go/exp/cmd/godef
go get -u code.google.com/p/go.tools/cmd/goimports

# Spacemacs
git clone -b develop --recursive https://github.com/syl20bnr/spacemacs ./.emacs.d
