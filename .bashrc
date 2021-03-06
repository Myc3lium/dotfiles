#!/bin/bash

#  ┳━┓  ┳━┓  ┓━┓  ┳ ┳  ┳━┓  ┏━┓
#  ┃━┃  ┃━┫  ┗━┓  ┃━┫  ┃┳┛  ┃  
#  ┇━┛  ┛ ┇  ━━┛  ┇ ┻  ┇┗┛  ┗━┛

# Allow execution of stuff in .bin regardless of interactive use.
export PATH="${HOME}/.bin:${PATH}:${HOME}/local/bin/"
export C_INCLUDE_PATH="${C_INCLUDE_PATH}:/usr/include:$HOME/repos/include"


# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return ;;
esac

# History config.
HISTCONTROL=ignoreboth
HISTSIZE= 											  # 64 Infinite history.
HISTFILESIZE= 										  # 100 Infinite history.
shopt -s histappend 								  # Append new history items.
PROMPT_COMMAND="history -a; history -n; echo;" # Auto-sync history.
export PROMPT_COMMAND+=$'printf "\033]0;%s\007" "$(echo $PWD | sed s=$HOME=\~=g )"'

shopt -s autocd 		# Automatically change directories
shopt -s checkwinsize 	# Update line/col count after each command
shopt -s cdspell 		# Find minor errors in directory spellings
shopt -s extglob 		# Enable exclusive globbing of filenames

stty -ixon 				# Disable C-s C-q.

# Prompt config 
normal="$(tput sgr0)"
reverse="$(tput rev)"
color1="$(tput setaf 1)"
color4="$(tput setaf 4)"
color5="$(tput setaf 5)"
color9="$(tput setaf 9)"

HOME_OFFSET=$((${#HOME}+1))
get_dir_symbol(){
	case "$PWD" in
		$HOME)
			# echo -en "${PWD:$HOME_OFFSET}\001${reverse}\002"
		;;

		$HOME/*) 
			echo -en "\001${reverse}${color5}\002 @ \001${color4}\002 ${PWD:$HOME_OFFSET} " 
		;;

		/*)     
			echo -en "\001${reverse}${color9}\002 # \001${color4}\002 ${PWD:1} " 
		;;
	esac
}


PS1='$(get_dir_symbol)\[${reverse}${color1}\] % \[${normal}\] '

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Useful exports.
export EDITOR=vim
export TERMINAL=urxvt-connect
export VISUAL=vim 	               # Calcurse notes.
export WWW_HOME="google.com"       # w3m w/out arguments startpage
export TERM="xterm-256color"       # Terminal escapes info
export PYTHONSTARTUP="$HOME/.pyrc"
export LOCATION=Derby              # Weather blocklet.
export display_=VGA-1              # Xrandr scripts.
export img_width=700               # feh_scale max width
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # Colored GCC warnings and errors.

[ -n "$DISPLAY" ] && export WID="$(xdotool getwindowfocus)"

# Less colors.
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb="$color4"   # Blinking.
export LESS_TERMCAP_md="$color6"   # Bold.
export LESS_TERMCAP_me="$normal"   # End bold, blink and underline.
export LESS_TERMCAP_se="$normal"   # Standout end.
export LESS_TERMCAP_so="$reverse"  # Start standout/ reverse.
export LESS_TERMCAP_ue="$normal"   # Underline end.
export LESS_TERMCAP_us="$color2"   # Underline start.

# Load aliases.
source ~/.config/bash/aliases
