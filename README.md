# DOTFILES

These are my personal dotfiles. They are and always will be a work in progress
:construction: so use at your own peril!

This assumes a new install on a mac and uses `brew` to manage software and
dependencies and stow to manage symlinking everything once complete

## Install

This assumes you have installed ruby and homebrew.

clone this repo into `~`

```sh
# installs all brew formulas
cd dotfiles
brew bundle
```

```sh
# sets up all symbolic links in $HOME
stow --dotfiles zsh vim gitconfig clojure pet
```

## A note on the Clojure setup

For documentation on the clj repl used have a look [here](https://asciinema.org/a/296507)
