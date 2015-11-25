#!/bin/bash
 
echo Linking vimrc to ~/.vimrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/vim ~/.vim

echo Linking screenrc to ~/.screenrc
ln -s $(pwd)/screenrc ~/.screenrc

echo Setting git configuration
git config --global user.name "Matt Welch"
git config --global user.email "mattw0308@gmail.com"
git config --global core.editor "vim"
git config --global push.default simple
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff

# initialize submodules
git submodule init
git submodule update

