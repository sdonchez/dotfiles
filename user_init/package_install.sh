#!/bin/bash

##update package lists
sudo apt-get update
sudo apt-get install --assume-yes \
	vim \
	tmux \
	zsh 
sudo apt-get upgrade --assume-yes
