#!/bin/bash

RUST_ANALYZER_VERSION="2022-12-26"

function install:rust() {
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

function install:rust:lsp() {
  rustup component add rust-analyzer
  ln -s $(rustup which --toolchain stable rust-analyzer) $LSP_BIN_DIRECTORY/rust-analyzer 
}