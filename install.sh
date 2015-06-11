#!/bin/bash
 
echo Linking vimrc to ~/.vimrc
ln -s $(pwd)/vimrc ~/.vimrc
echo Linking screenrc to ~/.screenrc
ln -s $(pwd)/screenrc ~/.screenrc
echo Setting git configuration
git config --global user.name "Matt Welch"
git config --global user.email "mattw0308@gmail.com"
git config --global core.editor "vim"
git config --global push.default simple

