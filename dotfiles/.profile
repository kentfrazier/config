#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

. "$HOME/.config-common"

source_if_exists "$HOME/.profile.$(uname -s)" "$HOME/.profile.private"

add_path '/usr/local/sbin'
add_path "$HOME/Dropbox/scripts"
add_path "$HOME/Dropbox/bin"
add_path "$HOME/UADropbox/bin"
add_path "$HOME/bin"
add_path "$HOME/local/bin"
add_path "$HOME/anaconda/bin"
add_path "$HOME/.cargo/bin"

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

