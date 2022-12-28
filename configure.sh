#!/bin/bash

set -e

LSP_DIRECTORY=$HOME/lsps
LSP_BIN_DIRECTORY=$LSP_DIRECTORY/bin

function before_install() {
  mkdir -p $LSP_BIN_DIRECTORY
}

before_install

languages=(rust csharp go)

for language in ${languages[@]}; do
  source ./scripts/configure-$language.sh

  echo "Installing $language..."
  $"install:$language"
  echo "Installing $language LSP..."
  $"install:$language:lsp"
  echo "done"
done
