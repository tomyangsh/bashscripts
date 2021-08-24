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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

PS1='[\u@\h \W]\$ '

export NOW=$(date +%Y-%m-%d-%H-%M-%S)
export GPG_TTY=$(tty)
#if [ ! -n "$DISPLAY" ]; then export MPV_HOME=~/.config/mpvc/; else unset MPV_HOME;fi

alias diff='diff -Naur'
alias makepkg='makepkg -sirc'
alias ll='ls -alhF --color=auto'
alias bb='BBDown -mt -tv -hevc'
alias su='su -'
alias m3u='/usr/bin/ls *.mp4 *.mkv>0.m3u'
alias ikoa='https_proxy=socks5://127.0.0.1:1080/ dev/ikoa/iKOA'
alias ytfzf='ytfzf -t'
alias showmyip='dig o-o.myaddr.l.google.com TXT @216.239.32.10'
alias mktorrent='mktorrent -pdvl 22'
alias translatesub='python ~/dev/python/deepl-translate.py'
alias less='bat'
