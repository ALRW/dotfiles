DOTFILES
===========================

Current base system setup. Feel free to take and use whatever is useful.

To install rake is required

```
gem install rake
```

The install script currently symlinks all top level files and those in the git and vim folders. To run the installation:

```
git clone https://github.com/ALRW/dotfiles.git && cd dotfiles && rake install
```

To do
-----------
- Update script to traverse through all folders and files within the dotfiles repo without having to manually add them to the script
- Add Mac specific configs
- Add system update script
