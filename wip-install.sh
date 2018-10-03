#!/bin/bash

# A Work in progress script to track installed tooling to speed setup in future
# Function to install brew packages

# The following are helper functions and data structures used by the script
brewInstall () {
        echo "Installing: $1"
        brew install $1
}

caskInstall () {
        echo "Installing: $1"
        brew cask install --appdir="/Applications" $1
}

# Function to check if a command exists and exit otherwise
checkExists () {
        command $1 >/dev/null 2>&1 ||
                { echo >&2 "ERROR: $1 required but not installed"; exit 1;}
        }

declare -a packages
packages=(
"ctags"
"htop"
"joker"
"leiningen"
"maven"
"knqyf263/pet/pet"
"the_silver_searcher"
"tree"
"vim --override-system-vim"
"jq"
"fzf"
"wifi-password"
"node"
"sbt"
"postgresql"
"bat"
"diff-so-fancy"
"confluent-oss"
"git-crypt"
)

declare -a casks
casks=(
"slack"
"alfred"
"postman"
"google-chrome"
)

# The actuall installation script

# Install the apple developer command line tools prompt
echo "Welcome to the worlds best Install Script"
echo "========================================="
printf "\n\n"
echo "Before continuing please ensure that you have the Apple Command-line tools installed"
echo "Hint: run 'xcode-select install'"
printf "\n\n"
read -p "Press any key to continue" -n1 -s
printf "\n\n"

# Install rvm
if checkExists curl; then
        curl -sSL https://get.rvm.io | bash;
fi

# If we have rvm then upgrade to the latest version of ruby
if checkExists rvm; then
        rvm install ruby --latest;
        rvm use --default --latest;
fi

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
for ((i = 0; i < ${#packages[@]}; i++)); do
        brewInstall ${packages[$i]}
done

# Install casks
for ((i = 0; i < ${#casks[@]}; i++)); do
        caskInstall ${casks[$i]}
done

# Create symbolic links for all dotfiles
ln -s ./alias ~/.alias
ln -s ./ctags ~/.ctags
ln -s ./profiles.clj ~/.lein/profiles.clj
ln -s ./tern-config ~/.tern-config
ln -s ./zshrc ~/.zshrc
ln -s ./vim/vimrc ~/.vimrc
ln -s ./vim/vimrc.bundles ~/.vimrc.bundles
ln -s ./vim/ideavimrc ~/.ideavimrc
ln -s ./pet/snippet.toml ~/.snippet.toml
ln -s ./git/gitconfig ~/.gitconfig
ln -s ./git/gitignore ~/.gitignore

# TODO Write script to create .gitconfig.local file with user and email
# TODO Make each phase of the installation user defined
