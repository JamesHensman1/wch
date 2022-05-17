#!/usr/bin/bash

if [ -z $(which cabal) ]; then
  echo "Please install cabal https://www.haskell.org/ghcup/"
	exit
fi

if [ ! -f "wch" ]; then
  cabal build
	cp dist/build/wch/wch .
fi

fname="test.txt"
if [ ! -z "$1" ]; then
  fname=$1
fi

echo  "Using file $fname"
echo "This is the regular wc command"
wc $fname
echo ""
echo "This is the haskell version"
./wch $fname

