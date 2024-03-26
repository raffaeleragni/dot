#!/usr/bin/env bash

alias rcc='cargo clippy && cargo build && cargo test'

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

export CARGO_TARGET_DIR=$HOME/.cargo-target
if [ ! -d $CARGO_TARGET_DIR ]; then
    mkdir -p $CARGO_TARGET_DIR
fi
export CARGO_INCREMENTAL=1
if [ ! -z "`which mold`" ]; then
  export RUSTFLAGS="$RUSTFLAGS -C linker=clang -C link-arg=-fuse-ld=/usr/bin/mold"
fi

