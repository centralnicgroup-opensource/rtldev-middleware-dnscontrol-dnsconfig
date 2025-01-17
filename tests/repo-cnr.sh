#!/bin/bash

export CNR_ENTITY='OTE'
export CNR_UID=$CNR_TEST_USER
export CNR_PW=$CNR_TEST_PASSWORD
export CNR_DOMAIN="dnscontroltest2-cnr.com"
# echo =================== NO DEBUG
# unset CNR_DEBUGMODE
# cd /usr/share/rtldev-middleware-dnscontrol-dnsconfig/rtldev-middleware-dnscontrol/integrationTest
# go test -v -verbose -provider CNR 

#echo =================== DEBUG
export CNR_DEBUGMODE=2
cd /usr/share/rtldev-middleware-dnscontrol-dnsconfig/rtldev-middleware-dnscontrol/integrationTest
go test -v -verbose -provider CNR
