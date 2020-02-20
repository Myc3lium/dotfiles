#!/bin/bash

#alias mkpss="apg -a 1 -m 20 -n 20 | tail -1"
#alias lspkg="apt list --installed | grep "                        #searches installed packages
#alias lsrdp="apt-cache --installed rdepends "                     #lists packages that depend on <package>
#alias lsdp="apt-cache --installed depends "                       #lists package dependencies
#alias cnct="nmcli -a device wifi connect"
#alias printer-kill="lprm -"
#alias net="nmcli dev wifi"
#alias lsiw="sudo iw dev wlp2s0 scan | egrep 'signal|SSID'"
#alias ahist="grep --color=always -A 30 -e "$(date +"%F")" -e "$(date -d "-1 day" +"%F")" -e "$(date -d "-2 day" +"%F")" -e "$(date -d "-3 day" +"%F")" /var/log/apt/history.log | less -R"

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always --group-directories-first'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

alias dir="ls --color=always -Altph"                              # List all files in dir.
alias mhd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -16" # List top memory consuming processes.
alias chd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -16" # List top cpu consuming processes
alias lsm="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem"
alias pks="apt search " #find a package based on name
alias pkfo="apt-cache show"
alias pss="gpg -d ~/.Private_Docs/pss.new.asc.asc | less"
alias less="less -R"
alias oyvey="shutdown now"
alias w3m="w3m -no-mouse" # -o auto_image=FALSE -no-graph "
alias py="python3"
alias rld="source ~/.bashrc"
alias fth="gforth"
alias hr="~/.bin/ghc"
alias swi="swipl"
alias aesthetic="figlet -d ~/repos/other/figlet-fonts -f wideterm.tlf "
alias fm="ranger "
alias hs=$'history'
alias hg="hs | grep"
alias svi="sudoedit"
alias gv="gvim"
alias vc="vi ~/.vimrc"
alias scc="gcc -Wall -Wextra -pedantic -Wno-comment -Wformat-nonliteral -Wformat-security -Wuninitialized -Winit-self -Warray-bounds=2  -Wenum-compare -Werror=implicit-function-declaration"

# Add manpage completion
#complete -W "$(man -k . | awk $'{ printf $1" "}') -Tpdf" man

# Awk completion. Script file, FS, and variable definition.
complete -W "-F -f -v --characters-as-bytes" awk

# Pathogen completion
complete -W "add remove upgrade" pathogen

# Pkm completion
complete -W "remove add update upgrade search info src" pkm

# Bleachbit cleaner completion
#complete -W "$(bleachbit -l) -c" bleachbit

# Add completion for sudo
#complete -W "$(compgen -c)" sudo

# Add which completion
#complete -W "$(compgen -c)" which

# Python3 help from outside python
pyhelp(){
    python3 -c "exec('help(\'$1\')')" | less
}

mkpss(){
	if [[ $# -eq 0 ]]; then
		apg -a 1 -m 20 -n 20 | sed '1q'
	else
		apg -a 1 -m $1 -n 20 | sed '1q'
	fi
}

# Launch fff and keep current dir on exit.
ff(){
    ~/repos/other/fff/fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
