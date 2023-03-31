/*
   dnsconfig.js: dnscontrol configuration file for HEXONET OT&E Demonstration.
*/

// Providers:
var REG_HX = NewRegistrar('hexonet');
var DNS_HX = NewDnsProvider('hexonet');

// Set Default TTL for all RR to reflect our Backend API Default
DEFAULTS(
    { "ns_ttl": "3600" },
    DefaultTTL(3600)
);

// Domains: 
// DnsProvider(DNS_HX) to add new nameservers
// DnsProvider(DNS_HX, 0) to override existing nameservers
// Readmore: https://docs.dnscontrol.org/advanced-features/nameservers

D('papakai123.com', REG_HX, DnsProvider(DNS_HX, 0), // Set the DNS provider but ignore the nameservers it suggests (0 == take none of the names it reports)
    NAMESERVER('ns1.ispapi.net.'),
    NAMESERVER('ns2.ispapi.net.'),
    NAMESERVER('ns3.ispapi.net.'),
    A('elk1', '10.190.234.178'),
    A('test', '56.123.54.12')
);
