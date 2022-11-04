#!/usr/bin/env bash

# Author    Teodorescu Alexandru Florentin
# For the fonts
#https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Retina/complete




# Functions
# ---------

homebrew_install()
{
  echo "It seems you don't have Homebrew installed."
  echo
  read -p "Install Homebrew? (y/n) " -n 1 answere
  echo
  if [[ $answere == "y" || $answere == "Y" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "updating Homebrew ..."
    brew update
    brew upgrade
  else
    echo "Sorry, for this automated Script we need Homebrew."
    echo "closing ..."
    exit 1
  fi
}

#Font setup 

read -p "Open and install fira font nerds ? (y/n)" -n 1 answer
echo
if [[ $answer == "y" || $answer == "Y" ]];then
open ~/.dotfiles/Fira\ Code\ Retina\ Nerd\ Font\ Complete.ttf
fi


#Xcode and Brew Setup

xcode-select --install
test -x brew || homebrew_install

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> .zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> .zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

#Fish shell

read -p "Install Fish Shell ? (y/n) " -n 1 answer
echo
if [[ $answer == "y" || $answer == "Y" ]]; then
brew install fish --HEAD
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
fish_add_path /opt/homebrew/bin
fi

Echo "Fish installed"

#Programs installs
brew install stow
brew install docker
brew install git
brew install starship

#Casks Installs
brew install --cask iterm2
brew install --cask spotify
brew install --cask discord
brew install --cask google-chrome
brew install --cask istat-menus
brew install --cask slack
brew install --cask alfred


clear

echo "Setup finished"
echo "--------------"
