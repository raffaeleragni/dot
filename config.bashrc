#!/bin/bash

DOTDIR=$HOME/.dot
for i in $(ls -A $DOTDIR/config); do
  DEST=$HOME/.config/$i
  if [ ! -e $DEST ]; then
    ln -sf $DOTDIR/config/$i $DEST
  fi
done
