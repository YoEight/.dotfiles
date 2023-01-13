#!/bin/bash

JDTLS_VERSION="1.9.0"
JDTLS_BIN="$JDTLS_VERSION-202203031534"
JAVA_VERSION="11"

function install:java() {
  if command -v javac &> /dev/null
  then
    echo "Java is already installed"
    return 0
  fi

  case $OS in
    ubuntu)
      sudo apt install -y \
        openjdk-$JAVA_VERSION-jdk \
        openjdk-$JAVA_VERSION-jre \
        openjdk-$JAVA_VERSION-doc \
        openjdk-$JAVA_VERSION-dbg

      ;;

    *)
      echo "Unsupported platform when installing Java"
      return 0
      ;;
  esac
}

function install:java:lsp() {
  if command -v jdtls &> /dev/null
  then
    echo "JDTLS is already installed"
    return 0
  fi

  wget -O /tmp/jdtls.tar.gz "https://download.eclipse.org/jdtls/milestones/$JDTLS_VERSION/jdt-language-server-$JDTLS_BIN.tar.gz"
  mkdir -p $LSP_DIRECTORY/jdtls
  tar -C $LSP_DIRECTORY/jdtls -xzf /tmp/jdtls.tar.gz
  ln -s $LSP_DIRECTORY/jdtls/bin/jdtls $LSP_BIN_DIRECTORY/jdtls
}
