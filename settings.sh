#!/bin/sh
# --------------------------------------
# Install plugins, frameworks, etc...
# --------------------------------------
## Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install app package managers
brew install carthage cocoapods

## Install front-end package managers
brew install yarn

## Install Node, Python and Ruby version managers
brew install nodenv pyenv rbenv

## Install iTerm2, zsh and zsh-related packages
brew cask install iterm2 && brew install tmux tree zsh

## Install zsh plugins manager
curl -L git.io/antigen > $HOME/antigen.zsh

## Update vim
brew install vim --with-override-system-vi

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
ln -sf ~/Git/jimmy/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Git/jimmy/dotfiles/.zshrc ~/.zshrc
ln -sf ~/Git/jimmy/dotfiles/ftplugin ~/.vim
ln -sf ~/Git/jimmy/dotfiles/filetype.vim ~/.vim