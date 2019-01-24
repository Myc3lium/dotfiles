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

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History config
HISTCONTROL=ignoreboth
HISTSIZE=30
HISTFILESIZE=100
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n" # auto-sync history

# Automatically change directories
shopt -s autocd

# Update line/col count after each command
shopt -s checkwinsize

# Find minor errors in directory spellings
shopt -s cdspell

# Prompt config
green="$(tput setaf 10)"
purple="$(tput setaf 5)"
blue="$(tput setaf 12)"
normal="$(tput sgr0)"

PS2='|: '
PS1='\n  [\[$blue\]\u\[$green\] ∘ \[$purple\]\w\[$normal\]] \[$green\]→\[$normal\] '  ## Patched fonts
#PS1='\n  ┍ $blue \u$normal + $green\w$normal\n  └╼ Λ  ∘  '  ## Patched fonts


# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always --group-directories-first'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Useful exports
export EDITOR=vim
export VISUAL=vim # Calcurse notes
export WWW_HOME="google.com"
export TERM="xterm-256color"
export PYTHONSTARTUP="$HOME/.pyrc"

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias L='ls -AlF'

# Allow execution of stuff in .bin
export PATH="${PATH}:${HOME}/local/bin/:${HOME}/.bin"

# Source aliases
source ~/.bin/aliases.sh

# wal restore
# wal -n -R -q
# wal -q --theme sexy-numixdarkest
# wal -q --theme sexy-dotshare
# wal -q --theme sexy-gjm
# wal -q --theme sexy-invisibone
# wal -q --theme sexy-monokai
# wal -q --theme sexy-vacuous2
# wal -q --theme sexy-visibone-alt-2
# wal -q --theme sexy-jasonwryan
# wal -q --theme sexy-hund
# wal -q --theme sexy-material
# wal -q --theme sexy-user-77-mashup-colors
# wal -q --theme sexy-monokai
# wal -q --theme sexy-navy-and-ivory
# wal -q --theme sexy-tartan
# wal -q --theme base16-gruvbox-pale
#wal -q --theme base16-gruvbox-hard
# wal -q --theme base16-material
# wal -q --theme base16-onedark
# wal -q --theme base16-tomorrow-night
# wal -q --theme base16tooth
# wal -q --theme base16-codeschool
# wal -q --theme tempus_rift
# wal -q --theme tempus_warp
# wal -q --theme darktooth
# wal -q --theme dkeg-bluetype
# wal -q --theme dkeg-blend
# wal -q --theme hybrid-material
# wal -q --theme spacemacs
# wal -q --theme vscode

