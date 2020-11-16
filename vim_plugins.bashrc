#!/bin/bash

DOTDIR=$HOME/.dot

if [ ! -d ~/.vim/pack/vendor/start/nerdtree ]; then
  git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
  vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
fi

