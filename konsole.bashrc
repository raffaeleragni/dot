#!/usr/bin/env bash

FILE="$HOME/.local/share/konsole/catppuccin-mocha.colorscheme"
URL="https://raw.githubusercontent.com/catppuccin/konsole/main/Catppuccin-Mocha.colorscheme"
if [ ! -f $FILE ]; then
    curl -o $FILE $URL
fi

