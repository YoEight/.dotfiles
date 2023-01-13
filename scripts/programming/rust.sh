#!/bin/bash

function install:rust() {
  if command -v cargo &> /dev/null
  then
    echo "Rust toolchain is already installed"
    return 0
  fi

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source "$HOME/.cargo/env"
}

function install:rust:lsp() {
  if command -v rust-analyzer &> /dev/null
  then
    echo "Rust analyzer is already installed"
    return 0
  fi

  rustup component add rust-analyzer
  ln -s $(rustup which --toolchain stable rust-analyzer) $LSP_BIN_DIRECTORY/rust-analyzer 
}
