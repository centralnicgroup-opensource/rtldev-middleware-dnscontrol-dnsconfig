#!/bin/bash
# NOTE: This file will be executed as remoteUser (devcontainer.json)
echo "=> Script: post-create.sh Executed by: $(whoami)"

sudo npm install --global --silent commitizen@latest cz-conventional-changelog@latest

# Install Z-shell
source <(curl -sL git.io/zi-loader); zzinit

# shellcheck source=/dev/null
source ~/.zshrc

if [[ !("$GITHUB_CLI") ]]; then
    # generate go binary && create a bin symlink
    cd rtldev-middleware-dnscontrol
    git checkout master && git fetch origin -p --tags && git pull
    go install && sudo ln -sF ~/go/bin/dnscontrol /usr/local/bin/ 
    go install golang.org/x/tools/cmd/stringer
    cd /usr/share/rtldev-middleware-dnscontrol-dnsconfig
fi