#!/bin/bash
PACKERDIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [ ! -d "$PACKERDIR" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKERDIR
fi

DOTDIR=$HOME/.dot
mkdir -p $HOME/.config/nvim
for i in $(ls -A $DOTDIR/nvim); do
  ln -sfn $DOTDIR/nvim/$i $HOME/.config/nvim/$i
done

