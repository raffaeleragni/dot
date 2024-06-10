#!/bin/bash

alias gmt='go mod tidy'

if [ ! -d "$HOME/.go" ]; then
    curl -sSf https://raw.githubusercontent.com/owenthereal/goup/master/install.sh | sh
    source "$HOME/.go/env"
    rm ~/.bash_profile
    echo 'source "$HOME/.go/env"' >> ~/.bashrc
fi

if [ ! -f "$HOME/go/bin/gopls" ]; then
    go install golang.org/x/tools/gopls@latest
fi

