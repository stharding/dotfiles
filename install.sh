#!/bin/bash

if [[ ! -d "~/.oh-my-zsh" ]]; then
  https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

git clone git@github.com:stharding/dotfiles.git ~/.dotfiles

cd ~/
for i in `\ls -a -1 ~/.dotfiles/`; do
  mv $i $i.old 2>/dev/null
  ln -s .dotfiles/$i . 2>/dev/null
done
