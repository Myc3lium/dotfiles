# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}[\u @ \h] \w] -➢ '
    #PS1='${debian_chroot:+($debian_chroot)}「\033[34m\u/\h\033[00m」\w\033[01;03;34m-➢\033[00m '
    #PS1='\033[1m❬\033[0m\033[4m\u @ \h\033[0m\033[1m❭\033[0m\033[1m \w\033[0m\033[1m❭\033[0m\033[1m \033[38;5;24m-➢\033[0m ' 
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias nano="nano -D -P -S --tabsize=4 -i -k -W"
alias dir="ls --color=always -Altph"                  #List all files in dir.

alias lspro="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | less"   #List running processes.
alias lsport="netstat -np | less"                                 #List ports and processes listening on them.

alias memhd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -16"   #List top memory consuming processes.
alias chd="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -16"
alias hgrep="history | grep "                                   #Search the terminal history.
alias agrep="alias -p | grep "                                  #Search bound aliases.

alias lspkg="apt list --installed | grep "                        #searches installed packages
alias lsrdp="apt-cache --installed rdepends "                     #lists packages that depend on <package>
alias lsdp="apt-cache --installed depends "                       #lists package dependencies
alias install="sudo apt-get install --autoremove"                #installs packages
alias uninstall="sudo apt-get remove --autoremove"               #removes and purges packages
alias rmdir="rm -r "                                              #removes directories
alias ckrk="sudo rkhunter --check --nocf --sk && sudo chkrootkit | grep  'infected\|found' && cat /var/log/rkhunter.log | grep 'found\|warning'"
#scans for rootkits etc.
alias pks="apt list | grep " #find a package based on name
alias pss="dcpt ~/.Private_Docs/pss.txt.asc | less"
alias xid="xprop | awk '/PID/ {print $3}'"

alias mkpss="apg -a 1 -m 20 -n 20 | tail -1"
alias bashconfig="nano ~/.bashrc && new"
alias aptdate="sudo apt-get update"
alias aptgrade="sudo apt-get upgrade"
alias apt-rec="grep --color=always -A 30 -e "$(date +"%F")" -e "$(date -d "-1 day" +"%F")" -e "$(date -d "-2 day" +"%F")" -e "$(date -d "-3 day" +"%F")" /var/log/apt/history.log | less -R"
alias less="less -R"

alias oyvey="bleachbit --preset -c && shutdown now"
alias prolog-compile="gplc "
alias pkgrep="apt list | grep "
alias vi="busybox vi "
alias printer-kill="lprm -"
alias pkfo="apt-cache show "
alias prolog-man="less /usr/share/doc/gprolog-doc/gprolog.pdf"
alias wdate='wal -n -q -i "$(cat ~/.config/i3/wallpaper)"'
alias lsiw="sudo iw dev wlp2s0 scan | egrep 'signal|SSID'"
alias ufetch='bash "$HOME/.config/i3/ufetch"'
clip="$HOME/.clip"

function pyhelp(){
    python3 -c "exec('help(\'$1\')')" | less
}

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


function links(){
    dir $1 | grep "\->"
}

function set_paper(){
	echo "$PWD/$1" > "$HOME/.config/i3/wallpaper"
	feh --bg-fill $1
}

export PATH="${PATH}:${HOME}/local/bin/:${HOME}/.bin"
xrdb ~/.Xresources ## merge with .Xresources to keep updated theming
#tracker daemon -k ## kill tracker
#(cat ~/.cache/wal/sequences &) ## apply wal to new terminals
#wal -R
wal -q --theme sexy-monokai
