#!/bin/bash

alias gmt='go mod tidy'
alias gbb='go fmt && golangci-lint run -E gofmt,revive && go test -race -timeout 20s'
export PATH=$PATH:$HOME/go/bin

if [ ! -d "$HOME/.go" ]; then
    curl -sSf https://raw.githubusercontent.com/owenthereal/goup/master/install.sh | sh
    source "$HOME/.go/env"
    rm ~/.bash_profile
    echo 'source "$HOME/.go/env"' >> ~/.bashrc
fi

source "$HOME/.go/env"

if [ ! -f "$HOME/go/bin/gopls" ]; then
    go install golang.org/x/tools/gopls@latest
fi

if [ ! -f "$HOME/go/bin/dlv" ]; then
    go install github.com/go-delve/delve/cmd/dlv@latest
fi

if [ ! -f "$HOME/go/bin/golangci-lint" ]; then
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.59.1
fi

