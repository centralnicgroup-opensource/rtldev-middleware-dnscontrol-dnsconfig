/bin/zsh -c "cd rtldev-middleware-dnscontrol && sudo go build -buildvcs=false -o ../ >/dev/null"
sudo chown vscode:vscode dnscontrol
./dnscontrol preview
echo "Testing Provider::HEXONET"
/bin/zsh -c "cd 'rtldev-middleware-dnscontrol/integrationTest' && go test -v -verbose -provider HEXONET"