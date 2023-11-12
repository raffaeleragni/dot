#!/bin/bash
if [ ! -d "$HOME/.fzf" ] && [ ! -z "`which git`" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

