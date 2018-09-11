# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History config
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=100
HISTFILESIZE=200

# update line/col count after each command
shopt -s checkwinsize

# prompt formatting
#if [ "$color_prompt" = yes ]; then
#    PS1=''
#else
PS1='[\u @ \h] \w] -➢ '
#fi
#unset color_prompt force_color_prompt

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dir="ls --color=always -Altph"                  #List all files in dir.
alias memhd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -16"   #List top memory consuming processes.
alias chd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -16"     # list top cpu consuming processes
alias hgrep="history | grep "                                   #Search the terminal history.
alias agrep="alias -p | grep "                                  #Search bound aliases.

alias lspkg="apt list --installed | grep "                        #searches installed packages
alias lsrdp="apt-cache --installed rdepends "                     #lists packages that depend on <package>
alias lsdp="apt-cache --installed depends "                       #lists package dependencies
alias install="sudo apt-get install --autoremove"                #installs packages
alias uninstall="sudo apt-get purge --autoremove"               #removes and purges packages
alias pks="apt list | grep " #find a package based on name
alias pss="gpg -d ~/.Private_Docs/pss.txt.asc | less"
alias xid="xprop | awk '/PID/ {print $3}'"

alias mkpss="apg -a 1 -m 20 -n 20 | tail -1"
alias adate="sudo apt-get update"
alias agrade="sudo apt-get upgrade"
alias ahist="grep --color=always -A 30 -e "$(date +"%F")" -e "$(date -d "-1 day" +"%F")" -e "$(date -d "-2 day" +"%F")" -e "$(date -d "-3 day" +"%F")" /var/log/apt/history.log | less -R"
alias less="less -R"

alias oyvey="bleachbit --preset -c && shutdown now"
alias vi="busybox vi "
alias printer-kill="lprm -"
alias pkfo="apt-cache show "
alias lsiw="sudo iw dev wlp2s0 scan | egrep 'signal|SSID'"
alias ufetch='bash "$HOME/.config/i3/ufetch"'
alias trix="cmatrix -as && clear"
alias net="nmcli dev wifi"
alias vimm="vim"


function cnct(){
	nmcli -a device wifi connect $1
}


clip="$HOME/.clip"

# find the size of an installed package
function pkmg(){
	apt-cache show $1 | grep Installed-Size | python3 -c "from sys import stdin;print(stdin.read().split()[1])"
}

# python3 help from outside python
function pyhelp(){
    python3 -c "exec('help(\'$1\')')" | less
}

# hex viewer
function 0xdmp(){
    python3 -c "
whitespacechars = (10, 9, 11, 32)
if '$1' == 'stdin':
    from sys import stdin;
    file = stdin.buffer;
else:
    file = open('$1', 'rb')
hx = lambda _bytes: '{0:<95}{2}\033[7m|{1:<32}|\033[0m'.format(' '.join([hex(byte)[2:].zfill(2) for byte in _bytes]), ''.join([chr(byte) if (byte not in whitespacechars) and (byte < 128) and (byte > 32) else '~' if (byte > 128) or (byte < 32) else '.' if byte in whitespacechars else '' for byte in _bytes]), ' '*4);

while True:
    k = file.read(32)
    if not k:
        break
    print(hx(k))
file.close()"
}

# list links in the current directory
function links(){
    dir $1 | grep "\->"
}

# set the wallpaper 
function set_paper(){
	feh --bg-fill $1
}

# allow execution of stuff in .bin
export PATH="${PATH}:${HOME}/local/bin/:${HOME}/.bin"
#wal -q --theme sexy-hund # set the terminal theming
wal -R -q
