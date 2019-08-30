#!/usr/bin/env bash

# install zsh
brew install zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"

PATH="$DOTFILES_DIR/bin:$PATH"


# Update dotfiles itself first

#git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~
ln -sfv "$DOTFILES_DIR/zsh/custom.zsh" ~/.oh-my-zsh/custom/
ln -sfv "$DOTFILES_DIR/iterm/com.googlecode.iterm2.plist" ~/Library/Preferences/com.googlecode.iterm2.plist
ln -sfv "$DOTFILES_DIR/.emacs.d" ~
ln -s "$DOTFILES_DIR/.emacs.d/.emacs-persistent-overlays" ~/.emacs-persistent-overlays
ln -s ~/.dotfiles/karabiner/assets/complex_modifications ~/.config/karabiner/assets/complex_modifications


ln -sfv  ~/.dotfiles/psql/.psqlrc ~/.psqlrc

if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi
