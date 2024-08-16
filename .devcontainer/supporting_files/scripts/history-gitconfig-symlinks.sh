#!/bin/bash
#set -x

# Create symlink for gitconfig and zsh history file
if [[  ! -L "${HOME}/.gitconfig" ]]; then
    ln -s "/WSL_USER/.gitconfig" "${HOME}/.gitconfig"
fi

if [[  ! -L "${HOME}/.zsh_history" ]]; then
    ln -s "/WSL_USER/.zsh_history" "${HOME}/.zsh_history"
fi