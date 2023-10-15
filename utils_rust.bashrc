#!/bin/bash

if [ -z "`which rustc`" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  rustup component add rust-analyzer
fi

