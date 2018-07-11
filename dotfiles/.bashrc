# Prompt
PS1='~ '

# Envars
HISTCONTROL=ignoredups:erasedups
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
export EDITOR="vim"
export IRC_CLIENT='irssi'
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Aliases
alias ls='ls --color=auto'
alias c='clear'
alias apt='sudo apt-get'
alias shutdown='sudo shutdown -P now'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias hc='herbstclient'
alias sf='screenfetch -t'
alias nf='neofetch'
alias nf-off='neofetch --config-off'
alias nf-small='neofetch --config Documents/neofetch-small'
alias uf='ufetch'

# Man page
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
