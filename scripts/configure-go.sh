#!/bin/bash

GO_VERSION="1.19.4"

function install:go() {
  if command -v go &> /dev/null
  then
    echo "Go tooling is already installed"
    return 0
  fi

  wget -O /tmp/go.linux.tar.gz https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf /tmp/go.linux.tar.gz
}

function install:go:lsp() {
  if ! command -v gopls &> /dev/null
  then
    go install golang.org/x/tools/gopls@latest  
  else
    echo "Gopls is already installed"
  fi

  if ! command -v dlv &> /dev/null
  then
    go install github.com/go-delve/delve/cmd/dlv@latest
  else
    echo "Dlv is already installed"
  fi
}
