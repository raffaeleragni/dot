#!/bin/bash

if [ ! -d "$HOME/.go" ]; then
    curl -sSf https://raw.githubusercontent.com/owenthereal/goup/master/install.sh | sh
fi

