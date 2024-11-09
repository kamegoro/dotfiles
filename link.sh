#!/bin/sh

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

cd ${dotfiles_root}/dotfiles
for file in .*; do
	ln -s ${PWD}/${file} ${HOME}
done
