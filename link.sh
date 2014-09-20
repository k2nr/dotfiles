#!/bin/bash


for f in .*
do
  if test $f != "." && test $f != ".." && test $f != ".DS_Store"; then
    echo replacing $f
    rm -rf $HOME/$f
    ln -s "`pwd`/$f" $HOME/$f
  fi
done
