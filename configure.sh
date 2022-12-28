#!/bin/bash

RUST_ANALYZER_VERSION="2022-12-26"

LSP_BIN_DIRECTORY=$HOME/lsps/bin

function before_install() {
  mkdir -p $LSP_BIN_DIRECTORY
}
  
function install:rust_analyzer() {
  wget -O /tmp/rust-analyzer.gz https://github.com/rust-lang/rust-analyzer/releases/download/$RUST_ANALYZER_VERSION/rust-analyzer-x86_64-unknown-linux-gnu.gz
  gzip -fd /tmp/rust-analyzer.gz
  cp /tmp/rust-analyzer $LSP_BIN_DIRECTORY
  chmod u+x $LSP_BIN_DIRECTORY/rust-analyzer
}

before_install
install:rust_analyzer