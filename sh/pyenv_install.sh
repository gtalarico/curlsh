#!/bin/bash

# Similar Reference
# https://gist.github.com/SebastiaAgramunt/5185ccf8637e69f611bd1217a98289b2

# XCode Path
CPPFLAGS="-I$(xcrun --show-sdk-path)/usr/include"


brew update
brew install zlib --force
brew install tcl-tk --force

TK_PATH="$(brew --prefix tcl-tk)"
export CPPFLAGS="${CPPFLAGS} -I${TK_PATH}/include"
export LDFLAGS="${LDFLAGS} -L${TK_PATH}/lib"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} ${TK_PATH}/lib/pkgconfig"

ZLIB_PATH="$(brew --prefix zlib)"
export CPPFLAGS="${CPPFLAGS} -I${ZLIB_PATH}/include"
export LDFLAGS="${LDFLAGS} -L${ZLIB_PATH}/lib"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} ${ZLIB_PATH}/lib/pkgconfig"

brew upgrade pyenv --force
