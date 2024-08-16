/*
   dnsconfig.js: dnscontrol configuration file for CNR OT&E Demonstration.
*/
// Providers:
var REG_CNR = NewRegistrar('CNR');
var DNS_CNR = NewDnsProvider('CNR');

// Access the JSON key
var domain = "dnscontroltest-cnr.com";

// Set Default TTL for all RR to reflect our Backend API Default
DEFAULTS(
    { "ns_ttl": "3600" },
    DefaultTTL(3600)
);

// Domains: 
// DnsProvider(DNS_CNR) to add new nameservers
// DnsProvider(DNS_CNR, 0) to override existing nameservers
// Readmore: https://docs.dnscontrol.org/advanced-features/nameservers

D(domain, REG_CNR, DnsProvider(DNS_CNR, 0), // Set the DNS provider but ignore the nameservers it suggests (0 == take none of the names it reports)
    NAMESERVER('ns1.rrpproxy.net.'),
    NAMESERVER('ns2.rrpproxy.net.'),
    NAMESERVER('ns3.rrpproxy.net.'),
    A('elk1', '10.190.234.178'),
    A('test', '56.123.54.12'),
    MX("@", 10, "helloworld.com.")
);
