#!/bin/bash
# file: set_git_config.sh

CWD=$(pwd)
SRC_DIR=${SRC_DIR:-$CWD}
echo Setting git configuration
git config --global user.name "Matt Welch"
git config --global user.email "matt.welch@intel.com"
git config --global core.editor "vim"
git config --global push.default current
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global commit.template ${SRC_DIR}/git-commit-template.txt
git config --global color.ui true
git config --global color.status.header "white normal dim"
git config --global color.status.untracked "white normal"
git config --global "alias.cv" "commit --verbose"

# initialize submodules
git submodule init
git submodule update

