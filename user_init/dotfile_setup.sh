#!/bin/bash

git pull

#delete old dotfiles and link in new ones

if [[ ! -d ~/.dotfiles_old ]]; then
	mkdir ~/.dotfiles_old
fi

date=$(date +%Y%m%d%H%M%S)

mkdir ~/.dotfiles_old/$date

if [[ -f ~/.bashrc ]]; then
	mv ~/.bashrc ~/.dotfiles_old/$date
fi
ln -s ~/.dotfiles/bashrc ~/.bashrc

if [[ -f ~/.profile ]]; then
	mv ~/.profile ~/.dotfiles_old/$date
fi
ln -s ~/.dotfiles/profile ~/.profile

if [[ -f ~/.aliases ]]; then
	mv ~/.aliases ~/.dotfiles_old/$date
fi
ln -s ~/.dotfiles/aliases ~/.aliases

if [[ -f ~/.zshrc ]]; then
	mv ~/.zshrc ~/.dotfiles_old/$date
fi
ln -s ~/.dotfiles/zshrc ~/.zshrc
