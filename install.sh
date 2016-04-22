#!/bin/bash
# assumes the install script is executed from its home directory - not safe! 
SRC_DIR=$(pwd) 

DOTFILE_LIST=( "vimrc" "vim" "screenrc" "bash_aliases" )
echo Linking vimrc to ~/.vimrc
ln -s ${SRC_DIR}/vimrc ~/.vimrc
ln -s ${SRC_DIR}/vim ~/.vim

echo Linking screenrc to ~/.screenrc
ln -s ${SRC_DIR}/screenrc ~/.screenrc

echo Linking bash_aliases to ~/.bash_aliases
ln -s ${SRC_DIR}/bash_aliases ~/.bash_aliases

echo Setting git configuration
git config --global user.name "Matt Welch"
git config --global user.email "mattw0308@gmail.com"
git config --global core.editor "vim"
git config --global push.default current
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global commit.template ${SRC_DIR}/git-commit-template.txt
git config --global color.ui true
git config --global color.status.header "white normal dim"
git config --global color.status.untracked "white normal"

# initialize submodules
git submodule init
git submodule update

