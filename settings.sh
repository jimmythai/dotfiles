#!/bin/sh
read -p "Path to the dotfiles directory(e.g. $HOME/fizz/buzz): " PATH_TO_DOTFILES

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
ln -sf $PATH_TO_DOTFILES/dotfiles/.vimrc ~/.vimrc
ln -sf $PATH_TO_DOTFILES/dotfiles/.zshrc ~/.zshrc
ln -sf $PATH_TO_DOTFILES/dotfiles/.gitconfig ~/.gitconfig
ln -sf $PATH_TO_DOTFILES/dotfiles/.gitignore_global ~/.gitignore_global

# --------------------------------------
# Open applications
# --------------------------------------
open /opt/homebrew/Caskroom/iterm2/*/iTerm.app
