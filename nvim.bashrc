#!/usr/bin/env bash

DOTDIR=$HOME/.dot
mkdir -p $HOME/.config/nvim
for i in $(ls -A $DOTDIR/nvim); do
  ln -sfn $DOTDIR/nvim/$i $HOME/.config/nvim/$i
done

if [ ! -z "`which vim`" ]; then
    alias vi=vim
    if [ ! -z "`which nvim`" ]; then
        alias vim=nvim
    fi
    if [ -f "$HOME/bin/nvim" ]; then
        alias vim=nvim
    fi
fi

