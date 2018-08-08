/*
   dnsconfig.js: dnscontrol configuration file for HEXONET OT&E Demonstration.
*/

// Providers:
var REG_HX = NewRegistrar('hexonet', 'HEXONET');
var DNS_HX = NewDnsProvider('hexonet', 'HEXONET');

// Set Default TTL for all RR - does not apply to NAMESERVER
// https://github.com/StackExchange/dnscontrol/issues/99
DEFAULTS(
    {"ns_ttl":"3600"},
    DefaultTTL(3600)
);

// Domains:
D('abhoster.com', REG_HX, DnsProvider(DNS_HX),
    NAMESERVER('ns1.ispapi.net.'),
    NAMESERVER('ns2.ispapi.net.'),
    NAMESERVER('ns3.ispapi.net.'),
    NAMESERVER('ns4.ispapi.net.'),
    A('elk1', '10.190.234.178'),
    A('test', '56.123.54.12')
);
