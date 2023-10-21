#!/bin/bash

if [ -z "`which rustc`" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source "$HOME/.cargo/env"
  rustup component add rust-analyzer
fi

if [ ! -z "`which mold`" ]; then
  export RUSTFLAGS="$RUSTFLAGS -C linker=clang -C link-arg=-fuse-ld=/usr/bin/mold"
fi

