#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export EDITOR="vim"
export CONFIGHOME=$HOME/Dropbox/config
export CONFIG_STORAGE=$HOME/.config_storage
export WORKON_HOME=$HOME/.virtualenvs
export GREP_OPTIONS="\
    --exclude=ctags \
    --exclude-dir=.git \
    --exclude-dir=.svn \
    --exclude-dir=.hg \
    --exclude=*.pyc \
    --exclude=*.pyo\
    "

if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi
