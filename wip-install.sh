#!/bin/bash

# A Work in progress script to track installed tooling to speed setup in future
# Function to install brew packages
brewInstall () {
        echo "Installing: $1 with brew"
        brew install $1
}
# Function to check if a command exists
checkExists () {
        command $1 >/dev/null 2>&1 ||
                { echo >&2 "ERROR: $1 required but not installed"; exit 1;}
}
#Install rvm
curl -sSL https://get.rvm.io | bash







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
)

for ((i = 0; i < ${#packages[@]}; i++)); do
        brewInstall ${packages[$i]}
done
