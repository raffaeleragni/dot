#!/bin/bash
DOTDIR=$HOME/.dot
mkdir -p $HOME/.config/nvim
for i in $(ls -A $DOTDIR/nvim); do
  ln -sfn $DOTDIR/nvim/$i $HOME/.config/nvim/$i
done

