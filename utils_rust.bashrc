#!/bin/bash

cargoenv () {
  if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
  fi
}

cargoenv

if [ -z "`which rustc`" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  cargoenv
  rustup component add rust-analyzer
fi

if [ ! -z "`which mold`" ]; then
  export RUSTFLAGS="$RUSTFLAGS -C linker=clang -C link-arg=-fuse-ld=/usr/bin/mold"
fi

