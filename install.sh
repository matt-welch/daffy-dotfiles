#!/bin/bash
# assumes the install script is executed from its home directory - not safe! 
SRC_DIR=$(pwd) 

DOTFILE_LIST=( "vimrc" "vim" "screenrc" "tmux.conf" "bash_aliases" )

echo Linking vimrc to ~/.vimrc
ln -s ${SRC_DIR}/vimrc ~/.vimrc
ln -s ${SRC_DIR}/vim ~/.vim

echo Linking screenrc to ~/.screenrc
ln -s ${SRC_DIR}/screenrc ~/.screenrc

echo Linking tmux.conf to ~/.tmux.conf
ln -s ${SRC_DIR}/tmux.conf ~/.tmux.conf

echo Linking bash_aliases to ~/.bash_aliases
ln -s ${SRC_DIR}/bash_aliases ~/.bash_aliases

./set_git_config.sh

