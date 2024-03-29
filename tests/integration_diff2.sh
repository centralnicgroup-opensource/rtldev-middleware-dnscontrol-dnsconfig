#!/bin/bash
# RSRMID-1094, let us see if this script is required in future or not
/bin/zsh -c "cd rtldev-middleware-dnscontrol && sudo go build -buildvcs=false -o ../ >/dev/null"
sudo chown vscode:vscode dnscontrol
./dnscontrol preview
echo "Testing Provider::HEXONET"
HEXONET_ENTITY="$(jq '.hexonet.apientity' --raw-output creds.json)"
HEXONET_UID="$(jq '.hexonet.apilogin' --raw-output creds.json)"
HEXONET_PW="$(jq '.hexonet.apipassword' --raw-output creds.json)"
HEXONET_DOMAIN="$(jq '.hexonet.domain' --raw-output creds.json)"
export HEXONET_ENTITY
export HEXONET_UID
export HEXONET_PW
export HEXONET_DOMAIN
/bin/zsh -c "cd 'rtldev-middleware-dnscontrol/integrationTest' && go test -v -verbose -provider HEXONET -diff2"