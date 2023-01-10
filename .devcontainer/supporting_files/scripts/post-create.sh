# generate go binary && create symlink
cd rtldev-middleware-dnscontrol
go install && sudo ln -sF ~/go/bin/dnscontrol /usr/local/bin/
cd /usr/share/rtldev-middleware-dnscontrol-dnsconfig