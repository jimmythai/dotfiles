#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# --------------------------------------
# Install plugins, frameworks, etc...
# --------------------------------------
## Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install mobile app package managers
brew install carthage cocoapods

## Install mobile app packages
brew install --cask flutter

## Install front-end package managers
brew install yarn

## Install Node, Python and Ruby version managers
brew install nodenv pyenv rbenv

## Install iTerm2, zsh and zsh-related packages
brew install --cask iterm2 && brew install tmux tree zsh

## Install zsh plugins manager
curl -L git.io/antigen > $HOME/antigen.zsh

## Update vim
brew install vim

## Install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

# --------------------------------------
# Set up terminal
# --------------------------------------
## To replace bash to zsh
chsh -s /bin/zsh

# --------------------------------------
# Make symbolic links
# --------------------------------------
## To make symbolic links
ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc
ln -sf $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -sf $SCRIPT_DIR/.gitignore_global ~/.gitignore_global
