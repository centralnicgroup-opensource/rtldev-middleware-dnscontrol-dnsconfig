#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

# NOTE: This file will be executed as remoteUser (devcontainer.json)
echo "=> Script: post-create.sh Executed by: $(whoami)"

sudo npm install --global --silent commitizen@latest cz-conventional-changelog@latest

# shellcheck source=/dev/null
source ~/.zshrc

if [[ !("$GITHUB_CLI") ]]; then
	echo "=> Generating Symlinks for Zsh History and Git config"
	/history-gitconfig-symlinks.sh

    # generate go binary && create a bin symlink
    cd rtldev-middleware-dnscontrol

    git checkout master && git fetch origin -p --tags && git pull
    go install && sudo ln -sF ~/go/bin/dnscontrol /usr/local/bin/ 
    go install golang.org/x/tools/cmd/stringer
    
    cd /usr/share/rtldev-middleware-dnscontrol-dnsconfig
fi