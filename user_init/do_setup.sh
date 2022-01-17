#!/bin/bash
echo "Installing Packages"
./user_init/package_install.sh

echo "Setting Up Dotfiles"
./user_init/dotfile_setup.sh

echo "Installing oh-my-zsh"
export CHSH=no
export RUNZSH=no
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing custom Spaceship Theme"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme

echo "Setting Default Terminal to zsh"
zsh_path=$(which zsh)
if [[ ! -z $zsh_path ]]; then
	chsh -s $zsh_path
else
	echo "zsh not found!"
fi

$zsh_path
