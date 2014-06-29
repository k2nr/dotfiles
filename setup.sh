#!/bin/bash

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew bundle

#install emacs cask
curl -fsSkL https://raw.github.com/cask/cask/master/go | python
