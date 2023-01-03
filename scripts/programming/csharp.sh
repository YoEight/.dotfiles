#!/bin/bash

CSHARP_VERSION="6.0"
OMNISHARP_VERSION="1.39.2"
NETCOREDBG_VERSION="2.2.0-961"

function install:csharp() {
  if command -v dotnet &> /dev/null
  then
    echo ".NET tooling is already installed"
    return 0
  fi

  wget -O $HOME/dotnet-install.sh https://dot.net/v1/dotnet-install.sh
  chmod +x $HOME/dotnet-install.sh
  $HOME/dotnet-install.sh -c $CSHARP_VERSION
}

function install_omnisharp() {
  if command -v OmniSharp &> /dev/null
  then
    echo "OmniSharp is already installed"
    return 0
  fi

  mkdir -p /tmp/omnisharp
  wget -O /tmp/omnisharp/omnisharp-linux.tar.gz https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$OMNISHARP_VERSION/omnisharp-linux-x64-net6.0.tar.gz
  pushd /tmp/omnisharp
  tar -xzf omnisharp-linux.tar.gz
  rm -rf omnisharp-linux.tar.gz
  chmod +x OmniSharp
  popd
  mv /tmp/omnisharp $LSP_DIRECTORY
  ln -s $LSP_DIRECTORY/omnisharp/OmniSharp $LSP_BIN_DIRECTORY/OmniSharp
}

function install_netcoredbg() {
  if command -v netcoredbg &> /dev/null
  then
    echo "NetcoreDBG is already installed"
    return 0
  fi

  wget -O /tmp/netcoredbg.tar.gz https://github.com/Samsung/netcoredbg/releases/download/$NETCOREDBG_VERSION/netcoredbg-linux-amd64.tar.gz
  pushd /tmp
  tar -xzf /tmp/netcoredbg.tar.gz
  rm -rf $LSP_DIRECTORY/netcoredbg
  mv netcoredbg $LSP_DIRECTORY
  popd
  ln -s $LSP_DIRECTORY/netcoredbg/netcoredbg $LSP_BIN_DIRECTORY/netcoredbg
}

function install:csharp:lsp() {
  install_omnisharp
  install_netcoredbg
}
