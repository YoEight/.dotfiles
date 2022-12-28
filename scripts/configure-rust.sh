#!/bin/bash

RUST_ANALYZER_VERSION="2022-12-26"

function install:rust() {
  if command -v cargo &> /dev/null
  then
    echo "Rust toolchain is already installed"
    return 0
  fi

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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