#!/bin/bash

cd $(dirname "$0")
DOTDIR="$(pwd)/"

if [[ ! -z $1 ]]; then
  DOTDIR="$1"
fi

cd ~/

if [[ ! -d ~/.oh-my-zsh ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -d ~/.vim ]]; then
  curl http://cs.unm.edu/~stharding/.vim.tgz -o .vim.tgz
  tar zxf .vim.tgz
  rm .vim.tgz
fi

for i in `\ls -ad1 $DOTDIR\.* | grep -v -e ".git"`; do
  j=$(basename $i)
  mv $j $j.old 2>/dev/null
  ln -s .dotfiles/$j . 2>/dev/null
done