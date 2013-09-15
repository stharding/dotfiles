#!/bin/bash

DOTDIR="~/.dotfiles/"

if [[ ! -z $1 ]]; then
  DOTDIR="$1"
fi

cd ~/

if [[ ! -d "~/.oh-my-zsh" ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -d "~/.vim" ]]; then
  curl http://cs.unm.edu/~stharding/.vim.tgz -o .vim.tgz
  tar zxf .vim.tgz
  rm .vim.tgz
fi

for i in `\ls -ad1 ~/.dotfiles/\.* | grep -v -e ".git"`; do
  mv $i $i.old 2>/dev/null
  ln -s .dotfiles/$i . 2>/dev/null
done
