# Tyler's BASH config file

# Aliases
alias fkinit="/usr/bin/kinit -A -f tlabree@FNAL.GOV"
alias vi='nvim'
alias ls='ls -h --color=always --time-style=long-iso'
alias ll='ls -lG'
alias la='ls -lAG'
alias lh='ls -1'
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# Prompt
red=$(tput setaf 1) # \e[31m
reset=$(tput sgr0)   # \e[0m
PS1="[\u\[$red\]@\[$reset\]\h \W]$ "

# Bash History
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

