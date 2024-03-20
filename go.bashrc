#!/bin/bash

if [ ! -d "$HOME/.go" ]; then
    curl -sSf https://raw.githubusercontent.com/owenthereal/goup/master/install.sh | sh
fi

if [ -z "`which gopls`"]; then
    go install golang.org/x/tools/gopls@latest
fi

