# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always --group-directories-first'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

alias dir="ls --color=always -Altph"                  #List all files in dir.
alias memhd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -16"   #List top memory consuming processes.
alias chd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -16"     # list top cpu consuming processes

alias lsm="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem"
alias lspkg="apt list --installed | grep "                        #searches installed packages
alias lsrdp="apt-cache --installed rdepends "                     #lists packages that depend on <package>
alias lsdp="apt-cache --installed depends "                       #lists package dependencies
alias pks="apt search " #find a package based on name
alias pss="gpg -d ~/.Private_Docs/pss.new.asc.asc | less"

# alias mkpss="apg -a 1 -m 20 -n 20 | tail -1"
mkpss(){
	if [[ $# -eq 0 ]]; then
		apg -a 1 -m 20 -n 20 | sed '1q'
	else
		apg -a 1 -m $1 -n 20 | sed '1q'
	fi
}

alias ahist="grep --color=always -A 30 -e "$(date +"%F")" -e "$(date -d "-1 day" +"%F")" -e "$(date -d "-2 day" +"%F")" -e "$(date -d "-3 day" +"%F")" /var/log/apt/history.log | less -R"
alias less="less -R"

alias oyvey="bleachbit --preset -c && shutdown now"
alias printer-kill="lprm -"
alias pkfo="apt-cache show"
alias lsiw="sudo iw dev wlp2s0 scan | egrep 'signal|SSID'"
alias net="nmcli dev wifi"
alias cnct="nmcli -a device wifi connect"
alias w3m="w3m -no-graph -no-mouse -o auto_image=FALSE "
alias py="python3"
alias pylocalinst="pip3 install --user "
alias rld="source ~/.bashrc"
alias fth="gforth"
alias colors="wal --preview | tail -3"
alias aesthetic="figlet -d ~/repos/other/figlet-fonts -f wideterm.tlf "
alias fm="ranger "
alias hs=history
alias hg="history | grep"
alias ,w="echo ur not using vim idiot"
alias ,q="echo ur not using vim idiot"

# Alias some dir-names.
alias ~pers="$HOME/repos/personal"
alias ~other="$HOME/repos/other"
alias ~assi="$HOME/Documents/assignments/"

clippy(){
	## Echo data to vim and yank to
	## system clipboard.
	vim -s <(printf 'ggVG"+yy') -
}

# Find the size of an installed package
function pkmg(){
	apt-cache show $1 | grep Installed-Size | python3 -c "from sys import stdin;print(stdin.read().split()[1])"
}

# Python3 help from outside python
pyhelp(){
    python3 -c "exec('help(\'$1\')')" | less
}

# Man with zathura
zman_ (){
	man -Tpdf $@ | zathura -
}
zman (){
	zman_ "$@" &
}

