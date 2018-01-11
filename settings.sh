#!/bin/sh

# -------------------
# Functions
# -------------------
tell_what_you_are_starting() {
echo "🏃‍♂️ START $1"
}

tell_what_you_have_finished() {
echo "🙆‍♂️ FINISH $1"
}

list_what_you_have_done() {
echo "====================================================================="
echo "$1"
echo "====================================================================="
}

# -------------------
# Install brew
# -------------------
BREW_COMMENT="INSTALLING BREW"
tell_what_you_are_starting "$BREW_COMMENT"

## Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## For App dev
brew install carthage

## For Front-end dev
brew install yarn 

## For Node, Python, Ruby
brew install nvm pyenv

## For iTerm2
brew cask install iterm2 && brew install tmux tree zsh zsh-completions

## Everything is installed!!
tell_what_you_have_finished "$BREW_COMMENT"

list_what_you_have_done "- brew
$(brew list)

- brew cask
$(brew cask list)"

# -------------------
# Set up terminal
# -------------------
TERMINAL_COMMENT="SETTING UP TERMINAL"
tell_what_you_are_starting "$TERMINAL_COMMENT"

# To replace bash to zsh
chsh -s /bin/zsh

tell_what_you_have_finished "$TERMINAL_COMMENT"

list_what_you_have_done "- Change bash to zsh"

# -------------------
# Make symbolic links
# -------------------
SYMBOLIC_COMMENT="MAKING SYMBOLIC LINKS"
tell_what_you_are_starting "$SYMBOLIC_COMMENT"

# To make symbolic links
ln -sf ~/Git/jimmy/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Git/jimmy/dotfiles/.zshrc ~/.zshrc
ln -sf ~/Git/jimmy/dotfiles/ftplugin ~/.vim
ln -sf ~/Git/jimmy/dotfiles/filetype.vim ~/.vim

list_what_you_have_done "- dotfiles
.vimrc
.zshrc
.vim
ftplugin
filetype.vim"