#!/bin/bash

if [ ! -d "$HOME/.go" ]; then
    curl -sSf https://raw.githubusercontent.com/owenthereal/goup/master/install.sh | sh
    source "$HOME/.go/env"
    rm ~/.bash_profile
fi

if [ -z "`which gopls`"]; then
    go install golang.org/x/tools/gopls@latest
fi

