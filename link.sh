#!/bin/bash

for f in .*
do
  if test $f != "." && test $f != ".."; then
    rm -rf $HOME/$f
    ln -s `pwd`/$f $HOME/$f
  fi
done
