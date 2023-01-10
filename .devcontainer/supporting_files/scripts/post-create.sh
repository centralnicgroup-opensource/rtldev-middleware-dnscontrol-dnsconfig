#!/bin/bash
# NOTE: This file will be executed as remoteUser (devcontainer.json)
echo "=> Script: post-create.sh Executed by: $(whoami)"
# Install Z-shell
source <(curl -sL git.io/zi-loader); zzinit

sudo npm install --silent --progress=false --global commitizen@latest cz-conventional-changelog@latest

# shellcheck source=/dev/null
source ~/.zshrc

# generate go binary && create a bin symlink
cd rtldev-middleware-dnscontrol
git checkout master && git fetch origin -p --tags && git pull
go install && sudo ln -sF ~/go/bin/dnscontrol /usr/local/bin/
cd /usr/share/rtldev-middleware-dnscontrol-dnsconfig