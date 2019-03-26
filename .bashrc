#   
#    █████                       █████     
#   ▒▒███                       ▒▒███      
#    ▒███████   ██████    █████  ▒███████  
#    ▒███▒▒███ ▒▒▒▒▒███  ███▒▒   ▒███▒▒███ 
#    ▒███ ▒███  ███████ ▒▒█████  ▒███ ▒███ 
#    ▒███ ▒███ ███▒▒███  ▒▒▒▒███ ▒███ ▒███ 
#    ████████ ▒▒████████ ██████  ████ █████
#   ▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒▒▒ ▒▒▒▒▒ 

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) 
		 export PATH="${PATH}:${HOME}/local/bin/:${HOME}/.bin" 
		 # Export path to allow use of .bin/ files even when in interactive.
		 return
	;;
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
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
purple="$(tput setaf 5)"
cyan="$(tput setaf 6)"
light_grey="$(tput setaf 7)"
dark_grey="$(tput setaf 8)"
white="$(tput setaf 15)"

# Print nice indicator for cwd.
GPWD(){ 
	case "$PWD" in
		$HOME*) echo "λ${PWD:14}" ;;
		*) 		echo "Σ/${PWD:1}"  ;;
	esac
}

PS1='\[${green}\]$(GPWD) \[${dark_grey}\]\[${red}\]~\[${normal}\]  '
PS2='\[${red}\]| \[${normal}\] '

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



# Useful exports.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # Colored GCC warnings and errors.
export EDITOR=vim
export VISUAL=vim 	   # Calcurse notes.
export WWW_HOME="google.com" # w3m w/out arguments startpage
export TERM="xterm-256color" # Terminal escapes info
export PYTHONSTARTUP="$HOME/.pyrc"
export LOCATION=Derby  # Weather blocklet.
export display_=VGA-1  # Xrandr scripts.
export img_width=700   # feh_scale max width

# Alias some dir-names.
alias ~pers="$HOME/repos/personal"
alias ~other="$HOME/repos/other"
alias ~assi="$HOME/Documents/assignments/"

# Allow execution of stuff in .bin
export PATH="${PATH}:${HOME}/local/bin/:${HOME}/.bin"

# Load aliases.
source ~/.bin/aliases.sh

# Launch fff and keep current dir on exit.
ff() {
    ~/repos/other/fff/fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
