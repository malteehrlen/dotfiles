#!/bin/bash

set -e

# update firmware
# sudo fwupdmgr update

# snaps
sudo snap refresh 

# apt
sudo apt-get update 
sudo apt-get dist-upgrade
sudo apt-get autoremove --purge

# neovim packages (https://github.com/wbthomason/packer.nvim)
nvim -c 'PackerSync'
