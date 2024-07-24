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

# Shorthands
alias l='ls'
alias c='cd'
alias v='vim'

# Other options
alias ll='ls -l'

# List files on 'cd'
cd() {
	builtin cd "$@" && ls
}

# Prompt
parse_git_dirty() {
    [ -n "$(git status --porcelain 2>/dev/null)" ] && printf "*"
}

parse_git_branch() {
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\n\[\e[36m\]\t\[\e[m\] \[\e[31m\]\h\[\e[m\] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
