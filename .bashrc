








#
#         ████████╵     ███████      ████████╷   ██╷    ██╷   ████████     ████████╷
#         ██┌─── ██╷   ██┌─── ██╷   ██┌──────┘   ██│    ██│   ██┌─── ██╷   ██┌─────┘
#         ██│    ██│   ██│    ██│   ██╵          ██│    ██│   ██│    ██│   ██│
#         ██╵    ██│   ██╵    ██│    ███████╵    ██╵    ██│   ██╵    ██│   ██│
#         ████████ ┘   █████████│    ╶────╴██╷   █████████│   ███████ ─┘   ██│
#         ██┌─── ██│   ██┌─── ██│          ██│   ██┌─── ██│   ██┌─── ██╷   ██│
#  ███╷   ██╵    ██╵   ██│    ██│          ██│   ██│    ██│   ██│    ██│   ██╵
#  ███│   ████████╷    ██│    ██│    ███████┌┘   ██│    ██│   ██│    ██│   ████████╷
#  ╶──┘   ╶───────┘    ╶─┘    ╶─┘    ╶──────┘    ╶─┘    ╶─┘   ╶─┘    ╶─┘   ╶───────┘

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# History config.
HISTCONTROL=ignoreboth
HISTSIZE= 										# 64 Infinite history.
HISTFILESIZE= 									# 100 Infinite history.
shopt -s histappend 							# Append new history items.
export PROMPT_COMMAND="history -a; history -n" 	# Auto-sync history.

shopt -s autocd 		# Automatically change directories
shopt -s checkwinsize 	# Update line/col count after each command
shopt -s cdspell 		# Find minor errors in directory spellings
shopt -s extglob 		# Enable exclusive globbing of filenames

stty -ixon 				# Disable C-s C-q

# Prompt config 
green="$(tput setaf 10)"
purple="$(tput setaf 5)"
blue="$(tput setaf 12)"
normal="$(tput sgr0)"

# Print nice indicator for cwd.
GPWD(){ 
	case "$PWD" in
		$HOME*) echo "λ${PWD:14}" ;;
		*) 		echo "+/${PWD:1}"  ;;
	esac
}

PS1='\n[\[$purple\]$(GPWD)\[$normal\]] \[$green\]→\[$normal\]  '  ## Patched fonts.
PS2='\[$blue\]↳\[$normal\] '

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Useful exports.
export EDITOR=vim
export VISUAL=vim 	   # Calcurse notes.
export WWW_HOME="google.com"
export TERM="xterm-256color"
export PYTHONSTARTUP="$HOME/.pyrc"
export LOCATION=Derby  # Weather blocklet.
export display_=VGA-1  # Xrandr scripts.
export img_width=700   # feh_scale max width

# Allow execution of stuff in .bin
export PATH="${PATH}:${HOME}/local/bin/:${HOME}/.bin"

# Load aliases.
source ~/.bin/aliases.sh

# Launch fff and keep current dir on exit.
ff(){ 
	~/repos/other/fff/fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
