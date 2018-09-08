#!/bin/bash

# A Work in progress script to track installed tooling to speed setup in future
# Function to install brew packages

# The following are helper functions and data structures used by the script
brewInstall () {
        echo "Installing: $1 with brew"
        brew install $1
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
)

# The actuall installation script

# Install the apple developer command line tools
xcode-select install

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



for ((i = 0; i < ${#packages[@]}; i++)); do
        brewInstall ${packages[$i]}
done
