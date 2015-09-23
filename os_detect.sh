#!/usr/bin/env bash

os_detect() {
  OS=
  # TODO: Could also check `uname`.
  case $OSTYPE in
    darwin*)
      # TODO Should we change to "darwin" or "osx"?
      OS=mac
      ;;
    linux*)
      OS=linux
      ;;
    win*)
      OS=windows
      ;;
    cygwin*)
      OS=linux-win
      ;;
    msys*)
      OS=linux-win
      ;;
    # TODO: Handle MinGW?
    freebsd*)
      OS=freebsd
      ;;
  esac
  echo $OS
}

if [[ $BASH_SOURCE[0] != $0 ]]; then
  if [ -n "$BASH_VERSION" ]; then
    export -f os_detect
  fi
else
  os_detect "${@}"
  exit $?
fi

