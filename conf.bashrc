#!/bin/bash

DOTDIR=$HOME/.dot
for i in $(ls -A $DOTDIR/conf); do
  ln -sf $DOTDIR/conf/$i $HOME/$i
done
