#!/usr/bin/env zsh
# shellcheck shell=bash
# Builds dnscontrol from the nested submodule and puts it on PATH.
#
# Runs after the devbase Feature's own post-create. Everything the previous
# version of this script did besides this -- installing commitizen globally,
# sourcing ~/.zshrc, symlinking ~/.gitconfig and ~/.zsh_history out of /WSL_USER
# -- is devbase's job or a host mount now.
set -e

SUBMODULE="rtldev-middleware-dnscontrol"

# In CI the container is created by devcontainers/ci and the integration test
# builds dnscontrol itself from the checked-out submodule, so moving the
# submodule's HEAD here would test something other than what was checked out.
# The old script expressed the same skip through GITHUB_CLI, which the workflow
# exported by hand.
if [ -n "${CI:-}" ]; then
    echo "=> CI detected; leaving ${SUBMODULE} at the checked-out commit"
    exit 0
fi

if [ ! -f "${SUBMODULE}/go.mod" ]; then
    echo "=> ${SUBMODULE} is not checked out; run 'git submodule update --init' and rerun this script"
    exit 0
fi

echo "=> Updating ${SUBMODULE}"
git -C "${SUBMODULE}" fetch origin -p --tags
git -C "${SUBMODULE}" checkout master
git -C "${SUBMODULE}" pull --ff-only

echo "=> Building dnscontrol"
(cd "${SUBMODULE}" && go install && go install golang.org/x/tools/cmd/stringer@latest)

# Read GOPATH from the toolchain rather than assuming ~/go: the go Feature sets
# GOPATH=/go, exactly as the go image this frame replaced did, so the old
# ${HOME}/go/bin path pointed at a binary that was never written there.
echo "=> Linking dnscontrol into /usr/local/bin"
sudo ln -sf "$(go env GOPATH)/bin/dnscontrol" /usr/local/bin/dnscontrol
