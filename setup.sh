#!/bin/bash

# instal vim and vimrc
git submodule init
git submodule update

# build command-t
cd bundle/command-t/ruby/command-t
(ruby extconf.rb && make clean && make) || warn "Ruby compilation failed."
