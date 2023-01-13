#!/bin/bash

LUA_VERSION="3.6.4"

function install:lua() {
  echo "Nothing to do"
}

function install:lua:lsp() {
  if command -v lua-language-server &> /dev/null
  then
    echo "LUA language server is already installed"
    return 0
  fi

  wget -O /tmp/lua-language-server.tar.gz "https://github.com/sumneko/lua-language-server/releases/download/$LUA_VERSION/lua-language-server-$LUA_VERSION-linux-x64.tar.gz"

  mkdir -p $LSP_DIRECTORY/lua
  tar -C $LSP_DIRECTORY/lua -xzf /tmp/lua-language-server.tar.gz
  ln -s $LSP_DIRECTORY/lua/bin/lua-language-server $LSP_BIN_DIRECTORY/lua-language-server
}
