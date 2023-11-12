#!/bin/bash

if [ ! -z "`which vim`" ]; then
    alias vi=vim
    if [ ! -z "`which nvim`" ]; then
        alias vim=nvim
    fi
    if [ -f "~/bin/nvim" ]; then
        alias vim=nvim
    fi
fi

