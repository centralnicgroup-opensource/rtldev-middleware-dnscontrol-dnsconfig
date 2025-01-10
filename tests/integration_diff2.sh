#!/bin/bash
# RSRMID-1094, let us see if this script is required in future or not
/bin/zsh -c "cd rtldev-middleware-dnscontrol && go build -buildvcs=false -o ../ >/dev/null"
# sudo chown vscode:vscode dnscontrol
# ./dnscontrol preview
echo "Testing Provider::CNR"
CNR_ENTITY="$(jq '.CNR.apientity' --raw-output creds.json)"
CNR_UID="$(jq '.CNR.apilogin' --raw-output creds.json)"
CNR_PW="$(jq '.CNR.apipassword' --raw-output creds.json)"
CNR_DOMAIN="$(jq '.CNR.domain' --raw-output creds.json)"
export CNR_ENTITY
export CNR_UID
export CNR_PW
export CNR_DOMAIN
/bin/zsh -c "cd 'rtldev-middleware-dnscontrol/integrationTest' && go test -v -verbose -provider CNR -diff2"