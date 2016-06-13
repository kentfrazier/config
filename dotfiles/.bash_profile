if [ -f  "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

if [ -e "$HOME/.bash_profile.$(uname -s)" ]; then
    . "$HOME/.bash_profile.$(uname -s)" 
fi

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -n "$(which ggrep)" ]; then
    grep="ggrep"
else
    grep="grep"
fi

alias grep="$grep \
    --color=auto \
    --exclude=ctags \
    --exclude-dir=.git \
    --exclude-dir=.svn \
    --exclude-dir=.hg \
    --exclude=*.pyc \
    --exclude=*.pyo\
    "
alias arc="$HOME/projects/arcanist/bin/arc"

add_path "$HOME/anaconda/bin"
