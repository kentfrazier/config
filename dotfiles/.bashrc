bash_completion="$(brew --prefix &>/dev/null)/etc/bash_completion" 
if [ -f "$bash_completion" ]; then
    . "$bash_completion"
fi

lsofps () {
    local file="$1"
    lsof -t "$file" | xargs ps -ww -p
}

psg () {
    local search="$(printf '[%s]%s' ${1:0:1} ${1:1})"
    ps aux | grep "$search"
}

build_alias () {
    local dest="$1"
    shift
    local src="$1"
    shift
    local args="$@"
    local current_src

    if alias "$src" >/dev/null 2>&1; then
        current_src="$(alias "$src")"
        current_src="${current_src:10}"
        current_src="${current_src:0:((${#current_src}-1))}"
    else
        current_src="$src"
    fi

    alias "$dest"="$current_src $args"
}

which virtualenvwrapper.sh > /dev/null && source `which virtualenvwrapper.sh`

alias ls="ls"

if [[ -e "$HOME/.bashrc.$(uname -s)" ]]; then
    . "$HOME/.bashrc.$(uname -s)" 
fi

complete -cf sudo  

# Aliases
alias sudo="sudo "

build_alias ls ls -F
build_alias ll ls -lh
build_alias la ls -A
build_alias lla ls -lhA

alias fontlist="fc-list | sed 's,:.*,,' | sort -u"
alias vi="vim"
alias ssh="ssh -C4c arcfour,blowfish-cbc"
