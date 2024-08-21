case $- in
*i*) ;;
*) return ;;
esac

# Shell options
shopt -s dotglob
shopt -s nocaseglob
shopt -s autocd
shopt -s cdspell
shopt -s histappend
shopt -s histverify

# Default options
alias ls='ls --color=auto -AF'
alias grep='grep --color=auto'
alias wget='wget --no-hsts'

# Shorthands
alias l='ls'
alias c='cd'
alias v='vim'
alias d='docker'
alias ff='fastfetch'
alias g='git'

# Corrections
alias nvim='vim'

# Other options and commands
alias ll='ls -l'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias dc='docker compose'

# Common files and directories
alias M='cd ~/compose'
alias D='cd ~/dotfiles'
alias S='cd ~/.ssh'
C() {
    case "$HOSTNAME" in
        blizzard) cd ~/compose/caddy ;;
        *) printf '%s' "Did you mean to be on blizzard?" ;;
    esac
}

alias R='vim ~/.bashrc'
alias P='vim ~/.bash_profile'
alias V='vim ~/.vim/vimrc'
alias G='vim ~/.gitconfig'

# List files on 'cd'
cd() {
	builtin cd "$@" && ls
}

# Prompt
parse_git_dirty() {
    [ -n "$(git status --porcelain 2>/dev/null)" ] && printf "*"
}

parse_git_branch() {
    command -v git >/dev/null 2>&1 || return
    while IFS= read -r line; do
        [ -z "$line" ] && return
        printf '%s' " (${line#* }$(parse_git_dirty))"
    done <<EOF
$(git branch --no-color 2>/dev/null)
EOF
}

export PS1="\n\[\e[36m\]\t\[\e[m\] \[\e[31m\]\h\[\e[m\] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Startup screen
case "$HOSTNAME" in
    blizzard)
        printf '%s' "\
 _     _ _                      _ 
| |__ | (_)__________ _ _ __ __| |
| '_ \\| | |_  /_  / _\` | '__/ _\` |
| |_) | | |/ / / / (_| | | | (_| |
|_.__/|_|_/___/___\\__,_|_|  \\__,_|
"
        ;;
    glacier)
        printf '%s' "\
       _            _           
  __ _| | __ _  ___(_) ___ _ __ 
 / _\` | |/ _\` |/ __| |/ _ \\ '__|
| (_| | | (_| | (__| |  __/ |   
 \\__, |_|\\__,_|\\___|_|\\___|_|   
 |___/                          
"
        ;;
esac
