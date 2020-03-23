#!/bin/bash

DOTDIR=$HOME/.dot
for i in $(ls -a $DOTDIR/conf); do
  if [ "$i" = "." ] || [ "$i" = ".." ]; then continue; fi
  ln -sf $DOTDIR/conf/$i
done
