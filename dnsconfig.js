/*
   dnsconfig.js: dnscontrol configuration file for HEXONET OT&E Demonstration.
*/

// Providers:
var REG_HX = NewRegistrar('hexonet', 'HEXONET');
var DNS_HX = NewDnsProvider('hexonet', 'HEXONET');

// Set Default TTL for all RR to reflect our Backend API Default
DEFAULTS(
    {"ns_ttl":"3600"},
    DefaultTTL(3600)
);

// Domains:
D('papakai123.com', REG_HX, DnsProvider(DNS_HX),
    NAMESERVER('ns1.ispapi.net.'),
    NAMESERVER('ns2.ispapi.net.'),
    NAMESERVER('ns3.ispapi.net.'),
    NAMESERVER('ns4.ispapi.net.'),
    A('ns1', '10.190.234.175'),
    A('ns2', '10.190.234.176'),
    A('ns3', '10.190.234.177'),
    A('ns4', '10.190.234.178')
);
