#!/bin/bash

DOTDIR="$HOME/.dot"

# set PATH so it includes user's private bin if it exists
if [ ! -d "$HOME/bin" ] ; then
  mkdir -p "$HOME/bin"
fi

PATH="$HOME/bin:$PATH"

if [ -d "$DOTDIR/bin" ] ; then
  for i in `ls "$DOTDIR/bin"`; do
    if [ ! -x "$HOME/bin/$i" ]; then
      ln -s "$DOTDIR/bin/$i" "$HOME/bin/$i"
    fi
  done
fi
