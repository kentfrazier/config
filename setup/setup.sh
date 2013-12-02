#!/bin/bash

if [[ -z "$CONFIGHOME" ]]; then
    CONFIGHOME=$HOME/Dropbox/config
fi
if [[ -z "$CONFIG_STORAGE" ]]; then
    CONFIG_STORAGE=$HOME/.config_storage
fi
mkdir -p $CONFIG_STORAGE/{sessions,backup,undo}

BACKUP_DIR="$HOME/config_backup_`date +%Y%m%d_%H%M%S`"
mkdir "$BACKUP_DIR"

for cfile in $(find "$CONFIGHOME/dotfiles" -mindepth 1 -maxdepth 1); do
    existing="$HOME/${cfile##*/}"
    if [[ -f "$existing" || -L "$existing" ]]; then
        mv "$existing" "$BACKUP_DIR";
    elif [[ -e "$existing" ]]; then
        echo "Unexpected file type:" "$existing"
        exit 1
    fi
    ln -s "$cfile" "$existing"
done

