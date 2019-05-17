#   
#    █████                       █████     
#   ▒▒███                       ▒▒███      
#    ▒███████   ██████    █████  ▒███████  
#    ▒███▒▒███ ▒▒▒▒▒███  ███▒▒   ▒███▒▒███ 
#    ▒███ ▒███  ███████ ▒▒█████  ▒███ ▒███ 
#    ▒███ ▒███ ███▒▒███  ▒▒▒▒███ ▒███ ▒███ 
#    ████████ ▒▒████████ ██████  ████ █████
#   ▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒▒▒ ▒▒▒▒▒ 

# Allow execution of stuff in .bin regardless of interactive use.
export PATH="${PATH}:${HOME}/local/bin/:${HOME}/.bin"

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
export PROMPT_COMMAND="history -a; history -n; echo;" # Auto-sync history.

shopt -s autocd 		# Automatically change directories
shopt -s checkwinsize 	# Update line/col count after each command
shopt -s cdspell 		# Find minor errors in directory spellings
shopt -s extglob 		# Enable exclusive globbing of filenames

stty -ixon 				# Disable C-s C-q.

# Prompt config 
normal="$(tput sgr0)"
reverse="$(tput rev)"
bold="$(tput bold)"
color1="$(tput setaf 1)"
color2="$(tput setaf 2)"
color3="$(tput setaf 3)"
color4="$(tput setaf 4)"
color5="$(tput setaf 5)"
color6="$(tput setaf 6)"
color7="$(tput setaf 7)"
color8="$(tput setaf 8)"
color9="$(tput setaf 9)"
color10="$(tput setaf 10)"
color11="$(tput setaf 11)"
color12="$(tput setaf 12)"
color13="$(tput setaf 13)"
color14="$(tput setaf 14)"
color15="$(tput setaf 15)"

PS1='[\[${color2}\]\w »\[${normal}\]] '
PS2='\[${color2}\]↳ \[${normal}\] '

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Useful exports.
export EDITOR=vim
export VISUAL=vim 	         # Calcurse notes.
export WWW_HOME="google.com" # w3m w/out arguments startpage
export TERM="xterm-256color" # Terminal escapes info
export PYTHONSTARTUP="$HOME/.pyrc"
export LOCATION=Derby  # Weather blocklet.
export display_=VGA-1  # Xrandr scripts.
export img_width=700   # feh_scale max width
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # Colored GCC warnings and errors.

# Less colors.
export LESS_TERMCAP_mb="$color4"   # Blinking.
export LESS_TERMCAP_md="$color6"   # Bold.
export LESS_TERMCAP_me="$noremal"  # End bold, blink and underline.
export LESS_TERMCAP_se="$normal"   # Standout end.
export LESS_TERMCAP_so="$reverse"  # Start standout/ reverse.
export LESS_TERMCAP_ue="$normal"   # Underline end.
export LESS_TERMCAP_us="$color2"   # Underline start.

# Directory: di
# File: fi
# Symbolic Link: ln
# Named Pipe: pi
# Socket: so
# Block Device: bd
# Character Device: cd
# Orphan Symbolic Link: or
# Missing File: mi
# Executable File: ex
# *.extension: files ending in ".extension"
# LS_COLORS=""
# export LS_COLORS="di=03;32:ex=03;32:ln=03;36:fi=37"


# Load aliases.
source ~/.bin/aliases.sh

# Launch fff and keep current dir on exit.
ff(){
    ~/repos/other/fff/fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
