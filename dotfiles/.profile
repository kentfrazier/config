#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [[ -e "$HOME/.profile.$(uname -s)" ]]; then
    . "$HOME/.profile.$(uname -s)" 
fi

if [[ -e "$HOME/.profile.private" ]]; then
    . "$HOME/.profile.private"
fi

add_path() {
    NEW_PATH="$1"
    if [ -d "$NEW_PATH" ] ; then
        export PATH="$NEW_PATH:$PATH"
    fi
}

add_path "$HOME/Dropbox/scripts"
add_path "$HOME/bin"

export EDITOR="vim"
export CONFIGHOME="$HOME/Dropbox/config"
export CONFIG_STORAGE="$HOME/.config_storage"
export CTAGS_DIRECTORY="$CONFIG_STORAGE/ctags"
export WORKON_HOME="$HOME/.virtualenvs"

if [ -n "$HOMEBREW_PREFIX" ]; then
    export MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman"
fi

if [ ! -d "$CONFIG_STORAGE" ]; then
    mkdir -p "$CONFIG_STORAGE"
fi

if [ -d "$HOME/.rbenv" ]; then
    add_path "$HOME/.rbenv/bin"
    eval "$(rbenv init -)"
    rbenv rehash
elif [ -s "$HOME/.rvm/scripts/rvm" ]; then
    . "$HOME/.rvm/scripts/rvm" 
fi

#if [[ -f /usr/libexec/java_home ]]; then
#    export JAVA_HOME="$(/usr/libexec/java_home -v1.7)"
#fi
#
#export MAVEN_OPTS='-Xmx1024m -XX:MaxPermSize=256m'
