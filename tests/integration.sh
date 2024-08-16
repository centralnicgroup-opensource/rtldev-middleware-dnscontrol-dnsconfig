#!/bin/bash
/bin/zsh -c "cd rtldev-middleware-dnscontrol && go build -buildvcs=false -o ../ >/dev/null"
# sudo chown vscode:vscode dnscontrol
# ./dnscontrol preview
echo "Testing Provider::CNR"
CNR_ENTITY="$(jq '.CNR.apientity' --raw-output creds.json)"
CNR_DOMAIN="$(jq '.CNR.domain' --raw-output creds.json)"
CNR_UID=$CNR_TEST_USER
CNR_PW=$CNR_TEST_PASSWORD
export CNR_ENTITY
export CNR_UID
export CNR_PW
export CNR_DOMAIN
/bin/zsh -c "cd 'rtldev-middleware-dnscontrol/integrationTest' && go test -v -verbose -provider CNR"