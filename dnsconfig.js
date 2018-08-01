/*
   dnsconfig.js: dnscontrol configuration file for ORGANIZATION NAME.
*/

// Providers:

var REG_HX = NewRegistrar('hexonet', 'HEXONET');
var DNS_HX = NewDnsProvider('hexonet', 'HEXONET');

// Domains:
D('abhoster.com', REG_HX, DnsProvider(DNS_HX),
    DefaultTTL(3600),
    NAMESERVER('ns1.ispapi.net'),
    NAMESERVER('ns2.ispapi.net'),
    NAMESERVER('ns3.ispapi.net'),
    NAMESERVER('ns4.ispapi.net'),
    A('elk1', '10.190.234.178'),
    A('test', '56.123.54.12')
);
