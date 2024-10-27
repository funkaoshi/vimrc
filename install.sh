#!/bin/bash

# Symlink current directory to ~/.vim
ln -s "$(pwd)" ~/.vim

# Symlink vimrc file to ~/.vimrc
ln -s "$(pwd)/vimrc" ~/.vimrc

# Download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install fzf based on the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    brew install fzf
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    sudo apt-get update
    sudo apt-get install -y fzf
else
    echo "Unsupported operating system"
    exit 1
fi

# Run PlugInstall inside Vim
vim +PlugInstall +qall

