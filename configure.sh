#!/bin/bash

GO_VERSION="1.19"
RUST_ANALYZER_VERSION="2022-12-26"

LSP_BIN_DIRECTORY=$HOME/lsps/bin

function before_install() {
  mkdir -p $LSP_BIN_DIRECTORY
}

function install:go() {
  sudo apt -y install golang-go
}

function install:go:lsp() {
  go install golang.org/x/tools/gopls@latest  
}

before_install

languages=(rust)

for language in ${languages[@]}; do
  source ./scripts/configure-$language.sh

  echo "Installing $language..."
  $"install:$language"
  echo "Installing $language LSP..."
  $"install:$language:lsp"
  echo "done"
done