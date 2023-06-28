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
HISTSIZE=10000
HISTFILESIZE=10000

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

PS1='\u@\h:\w\$ '
HISTTIMEFORMAT="%Y-%m-%d %T "
NOW=$(date +%Y-%m-%d-%H-%M-%S)
GPG_TTY=$(tty)
PATH=/home/tomyang/.local/bin:/usr/bin:/usr/sbin
#if [ ! -n "$DISPLAY" ]; then export MPV_HOME=~/.config/mpvc/; else unset MPV_HOME;fi


m3u8() {
	rm list.m3u8
	for i in $1*.{mp4,mkv}; do
		echo "file '$i'" >> list.m3u8
	done
}

zipedit(){
    echo "Usage: zipedit archive.zip folder/file.txt"
    curdir=$(pwd)
    unzip "$1" "$2" -d /tmp 
    cd /tmp
    vim "$2" && zip "$curdir/$1"  "$2" 
    # remove this line to just keep overwriting files in /tmp
    rm -f "$2" # or remove -f if you want to confirm
    cd "$curdir"
}

alias diff='diff -Naur'
alias makepkg='makepkg -sirc'
alias ll='ls -alhF --color=auto'
alias su='su -'
alias showmyip='dig o-o.myaddr.l.google.com TXT @216.239.32.10'
alias tr-cr='transmission-create -p -s 4096 -t https://tracker.m-team.cc/announce.php'
alias pipu='pip freeze --user > ~/dev/test/pip.txt ; sed -i s/==.*//g ~/dev/test/pip.txt ; pip install -U -r ~/dev/test/pip.txt'
alias fars='curl -F c=@- https://fars.ee'
alias dmmdl='python -m hlsdl --limit-per-host 10 --disable-auto-concat'
alias rclonecopy='rclone copy -vPL --transfers=1 --drive-server-side-across-configs --no-update-modtime'

if [ ! -n "$MC_SID" ]; then eval "$(starship init bash)"; fi
alias df='df -hT -x tmpfs -x devtmpfs'
alias tr-ls='transmission-remote -tactive -l'
alias mpv='systemd-run --user mpv'
alias bdinfocli='mono ~/.local/BDInfoCLI-ng_v0.7.5.5/BDInfo.exe'
alias imgbb='wl-paste --type image/png |curl --request POST "https://api.imgbb.com/1/upload?key=314470a578e045760318fd032d9637f7" -F image=@- | jq | grep -m 1 \"url\"'
alias catbox='wl-paste --type image/png |curl --request POST -F "reqtype=fileupload" -F "fileToUpload=@-;filename=image.png" "https://catbox.moe/user/api.php"'
