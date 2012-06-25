#!/bin/bash

BACKUP_DIR=$HOME/config_backup_`date +%Y%m%d_%H%M%S`

mkdir $BACKUP_DIR

SCRIPTS=$(ls $CONFIGHOME/dotfiles)

for name in ${SCRIPTS[@]}; do
    mv $HOME/$name $BACKUP_DIR;
done
for name in ${SCRIPTS[@]}; do
    ln -s $CONFIGHOME/dotfiles/$name $HOME/$name;
done

mkdir --parents \
    $HOME/.config_storage/vim/sessions \
    $HOME/.config_storage/vim/backup \
    $HOME/.config_storage/vim/undo
