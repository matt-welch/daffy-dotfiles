# file: .bash_aliases
alias isodate='date +"%Y%m%dT%H%M%S"'
alias mount_shar='~/mount-sharedrive.sh shared'
alias mount_priv='~/mount-sharedrive.sh private'
alias update-all-the-things='sudo apt-get update && sudo apt-get upgrade'
alias tinyprompt='export PS1="${debian_chroot:+($debian_chroot)}\u@\h:[\W]\$ "'
# git aliases
alias git-proxy-remote='export GIT_PROXY_COMMAND="~/git-proxy-wrapper"'
alias gs='git status'
# docker aliases
alias dim='docker images'
alias dpsa='docker ps -a'
alias dima='docker images -a'
#lxc aliases 
alias vlxc="virsh -c lxc:///" 
alias lxclf='lxc list --fast'

export BASH_LAST_FILE="$BASH_LAST_FILE, /home/matt/.bash_aliases"
#export BASH_LAST_FILE="$BASH_LAST_FILE, $0"
# This is a vim modeline
# vim: set ft=sh ts=4 tw=72 sw=4:

