#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"

PATH="$DOTFILES_DIR/bin:$PATH"


# Update dotfiles itself first

#git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

brew install jq

mkdir ~/bin
ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~
ln -sfv "$DOTFILES_DIR/zsh/themes/fridaynight.zsh-theme" ~/.oh-my-zsh/themes/
ln -sfv "$DOTFILES_DIR/zsh/custom.zsh" ~/.oh-my-zsh/custom/
ln -sfv "$DOTFILES_DIR/extras/batcharge.py" ~/bin
ln -sfv "$DOTFILES_DIR/iterm/com.googlecode.iterm2.plist" ~/Library/Preferences/com.googlecode.iterm2.plist
ln -sfv "$DOTFILES_DIR/.emacs.d" ~

chmod +rwx ~/bin/batcharge.py
chmod +rwx "$DOTFILES_DIR/extras/batcharge.py"

if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi
