#!/bin/bash

# set PATH so it includes user's private bin if it exists
if [ ! -d "$HOME/bin" ] ; then
  mkdir -p "$HOME/bin"
fi

PATH="$HOME/bin:$PATH"
