alias git-proxy-remote='export GIT_PROXY_COMMAND="~/git-proxy-wrapper"'
alias isodate='date +"%Y%m%dT%H%M%S"'
alias mount_shar='~/mount-sharedrive.sh shared'
alias mount_priv='~/mount-sharedrive.sh private'
alias update-all-the-things='sudo apt-get update && sudo apt-get upgrade'
alias tinyprompt='export PS1="${debian_chroot:+($debian_chroot)}\u@\h:[\W]\$ "'
alias gs='git status'

# if this is a screen window, prevent vim from connecting to the X-clipboard which is often VERY slow
case "$TERM" in 
    screen)
        # screen takes forever to connect to clipboard when opening vim, disable X-clipboard
        alias vim='vim -X'
        ;;
    xterm)
        # xterm is slow too :((when opening vim, disable X-clipboard
        alias vim='vim -X'
        ;;
    *)
        ;;
esac

# This is a vim modeline
# vim: set ft=sh ts=4 tw=72 sw=4:

