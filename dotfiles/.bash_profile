. "$HOME/.config-common"
source_if_exists "$HOME/.profile"
source_if_exists \
    "$HOME/.bash_profile.$(uname -s)" \
    "$HOME/.bash_profile.private"
#source_if_exists "$(which virtualenvwrapper.sh)"
source_if_exists "$HOME/.git-completion.bash"

complete -cf sudo  

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# --- Aliases --- #
alias sudo="sudo "

build_alias ls ls -F
build_alias ll ls -lh
build_alias la ls -A
build_alias lla ls -lhA
build_alias sbt-no-color sbt -Dsbt.log.noformat=true
build_alias vi vim
if [ -e "$(which ggrep)" ]; then
    alias grep=ggrep
fi
build_alias grep grep --color=auto --exclude=ctags --exclude-dir=.git --exclude-dir=.svn --exclude-dir=.hg --exclude=*.pyc --exclude=*.pyo

# --- History File Management --- #
HISTDIR="$HOME/.history" 
if [[ ! -d "$HISTDIR" ]]; then
    mkdir "$HISTDIR"
    chmod 0700 "$HISTDIR"
fi
HISTTIMEFORMAT='%F %T '
HISTFILE="$HISTDIR/$(date -j +'%Y-%m-%dT%H:%M:%S')"  # Make process-specific history file
HISTFILESIZE=0                  # close any old history files
HISTFILESIZE=4096               # and set a large new size
HISTSIZE=4096

hist-search () {
    if [ $# -lt 1 ]; then
        echo 'Provide one or more patterns to search for.'
        return 1
    fi
    local cmd="grep -r '$HISTDIR' -e '$1' -H --color=never"
    shift
    for pattern in "$@"; do
        cmd="$cmd | grep -e '$pattern' --color=never"
    done
    cmd="$cmd | sort"
    echo "$cmd"
    eval "$cmd"
}
hist-clean () {
    time_clause="${1:-4w}"
    find_cmd="find $HISTDIR -type f -mtime +$time_clause"
    echo $find_cmd
    $find_cmd -print0 | xargs -0 ls -lt
    read -p "Delete these files? " -n 1 -r
    echo
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        $find_cmd -delete
    fi
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

