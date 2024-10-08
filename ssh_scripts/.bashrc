# REMOTE HOST bash configuration

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Append the "~/bin" dir to add all scripts uploaded by `sshcp` to PATH
export PATH="$PATH:$HOME/bin"

# User specific aliases and functions

export EDITOR="vim"
export VISUAL="$EDITOR"

alias v='vim'
alias vi='vim'
alias nvim='vim'
