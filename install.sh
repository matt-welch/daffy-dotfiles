#!/bin/bash
# assumes the install script is executed from its home directory - not safe! 
SRC_DIR=$(pwd) 

echo Linking vimrc to ~/.vimrc
ln -s ${SRC_DIR}/vimrc ~/.vimrc
ln -s ${SRC_DIR}/vim ~/.vim

echo Linking screenrc to ~/.screenrc
ln -s ${SRC_DIR}/screenrc ~/.screenrc

echo Setting git configuration
git config --global user.name "Matt Welch"
git config --global user.email "mattw0308@gmail.com"
git config --global core.editor "vim"
git config --global push.default current
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global commit.template ${SRC_DIR}/git-commit-template.txt

# initialize submodules
git submodule init
git submodule update

