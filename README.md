# Ramanan's Vim Setup

This repository contains the configuration I use when running [`vim`][]. This
is a fairly minimal vimrc, a good starting point for someone who wants to fork
and extend with their own customizations.

[vim-plug][] is used to manage vim plugins. Notable plugins used include:
[ale] for (async) linting, [fzf][] for quickly opening files,
[vim-airline][] for a helpful status bar, and [goyo][] for distraction
free text editing.

[gruvbox][] is the vim colour theme.

## Pre-requisites

- vim v9.0+
- brew or apt to install packages
- curl to fetch vim-plug

## Installation

You can install everything using the included shell script: `./install.sh`.
This will perform the following operations:

 - symlink the directory to `~/.vim`
 - symlink the `vimrc` file within this directory to `~/.vimrc`
 - grab `vim-plug`: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
 - install `fzf` and `rust-analyzer`
 - run `PlugInstall` inside Vim to install bundles using `vim-plug`


[vim]: https://www.vim.org/
[vim-plug]: https://junegunn.github.io/vim-plug/
[ale]: https://github.com/dense-analysis/ale
[fzf]: https://github.com/junegunn/fzf
[vim-airline]: https://github.com/vim-airline/vim-airline
[goyo]: https://github.com/junegunn/goyo.vim
