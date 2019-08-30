
# ,dPYb,                          ,dPYb,                          
# IP'`Yb                          IP'`Yb                          
# I8  8I                          I8  8I                          
# I8  8'                          I8  8'                          
# I8 dP       ,gggg,gg    ,g,     I8 dPgg,     ,gggggg,    ,gggg, 
# I8dP  888ggdP"  "Y8I   ,8'8,    I8dP" "8I    dP""""8I   dP"  "Yb
# I8P    8I i8'    ,8I  ,8'  Yb   I8P    I8   ,8'    8I  i8'      
#,d8b,  ,8I d8,   ,d8b,,8'_   8) ,d8     I8, ,dP     Y8,,d8,_    _
#8P'"Y88P"' "Y8888P"`Y8P' "YY8P8P88P     `Y8 8P      `Y8P""Y8888PP

#           			slick's x200 bashrc

# prompt
export BASH_IT="/home/slick/.bash_it"
export BASH_IT_THEME='simple'
export SCM_CHECK=true
source "$BASH_IT"/bash_it.sh

# envars
HISTCONTROL=ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend
shopt -s checkwinsize
export VISUAL=vim
export IRC_CLIENT='irssi'
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# aliases
alias ls='ls --color=auto --group-directories-first'
alias c='clear'
alias apt='sudo apt-get'
alias elevate='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias autoremove='sudo apt-get autoremove'
alias shutdown='sudo shutdown -P now'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias hc='herbstclient'
alias cursor-off='setterm -cursor off'
alias vga-on='xrandr --output VGA-1 --mode 1920x1080 && hc set_monitors 1920x1080+0+0'
alias vga-off='xrandr --output VGA-1 --off && hc detect_monitors'

alias t='tmux'
alias r='ranger'
#alias webm='ffmpeg -i grab.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis grab.webm'
alias webm='ffmpeg -i grab.mp4 -c:v libvpx -crf 30 -b:v 0 -b:a 128k -c:a libopus grab.webm'

alias yt='mpv'
alias yta='mpv --no-video'
alias dyt="youtube-dl -if 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias dyta="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0"

alias sf='screenfetch -t'
alias nf='neofetch --clean && neofetch'
alias nf-off='neofetch --config-off'
alias nf-small='neofetch --clean && neofetch --config Documents/rice/neofetch-small'
alias uf='ufetch'

# man page
man() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[1;33m") \
                LESS_TERMCAP_md=$(printf "\e[1;33m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                        man "$@"
}

stty -ixon
