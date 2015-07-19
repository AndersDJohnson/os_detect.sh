#!/usr/bin/env bash

os_detect() {
  OS=
  case $OSTYPE in
    darwin*)
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
    freebsd*)
      OS=freebsd
      ;;
  esac
  echo $OS
}

if [[ $BASH_SOURCE[0] != $0 ]]; then
  export -f os_detect
else
  os_detect "${@}"
  exit $?
fi
