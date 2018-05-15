#!/bin/bash


## Clone Vundle to manage all plugins (use the events branch)
install_vundle()
{
    [[ -d ~/.vim/bundle/vundle/.git ]] &&
        { echo "Vundle is already installed"; return 0; }
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ||
        { echo "Could not clone Vundle"; return 1; }
    return 0
}

## Use vundle to download all vim plug-ins
get_bundles()
{
    echo "Updating Vim Bundles"
    install_vundle || return 1
    vim +PluginInstall +qa || (echo "Error installing bundles"; return 1 )
}

install_vundle
get_bundles
