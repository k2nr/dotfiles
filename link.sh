#!/usr/bin/env bash


for f in ./dotfiles/.*
do
  filename=`basename $f`
  if test $filename != "." && test $filename != ".." && test $filename != ".DS_Store"; then
    echo replacing $filename
    rm -rf $HOME/$filename
    ln -s "`pwd`/$f" $HOME/$filename
  fi
done
