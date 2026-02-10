/*
   dnsconfig.js: dnscontrol configuration file for CNR OT&E Demonstration.
*/
// Providers:
var REG_CNR = NewRegistrar('CNR');
var DNS_CNR = NewDnsProvider('CNR');

// Access the JSON key
var domain = "dnscontroltest2-cnr.com";

// Set Default TTL for all RR to reflect our Backend API Default
DEFAULTS(
    { "ns_ttl": "3600" },
    DefaultTTL(3600)
);

// Domains:
// DnsProvider(DNS_CNR) to add new nameservers
// DnsProvider(DNS_CNR, 0) to override existing nameservers
// Readmore: https://docs.dnscontrol.org/advanced-features/nameservers

D(domain, REG_CNR, DnsProvider(DNS_CNR, 0),
    NAMESERVER('ns1.rrpproxy.net.'),
    NAMESERVER('ns2.rrpproxy.net.'),
    NAMESERVER('ns3.rrpproxy.net.'),

    // --- Standard RR types ---
    A('elk1', '10.190.234.178'),
    A('test', '56.123.54.12'),
    A('@', '1.2.3.4'),
    AAAA('ipv6', '2001:0db8:85a3:0000:0000:8a2e:0370:7334'),
    ALIAS('@', 'example.com.'),
    CAA('@', 'issue', 'letsencrypt.org'),
    CAA('@', 'iodef', 'mailto:admin@example.com'),
    CNAME('www', 'elk1.dnscontroltest2-cnr.com.'),
    CNAME('mail', 'helloworld.com.'),
    MX('@', 10, 'helloworld.com.'),
    MX('@', 20, 'backupmx.example.com.'),
    NAPTR('@', 100, 10, 'u', 'E2U+sip', '!^.*$!sip:info@example.com!', '.'),
    NS('delegated', 'ns1.example.com.'),
    PTR('ptr-test', 'host.example.com.'),
    SRV('_sip._tcp', 10, 60, 5060, 'sipserver.example.com.'),
    SSHFP('sshfp-test', 1, 1, '25b07e5aeda0a3dfc3060e34ac1c1ef3cbe04ae3'),
    TLSA('_443._tcp.tlsa-test', 3, 1, 1, 'abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789'),
    TXT('@', 'v=spf1 include:example.com ~all'),
    TXT('_dmarc', 'v=DMARC1; p=reject'),

    // --- New RR types (DHCID, DNAME, LOC, SVCB) ---
    DHCID('dhcid-test', 'AAIBY2/AuCccgoJbsaxcQc9TUapptP69lOjxfNuVAA2kjEA='),
    DNAME('dname-test', 'example.com.'),
    LOC('loc-test', 52, 14, 5, 'N', 0, 8, 50, 'E', 10, 0, 0, 0),
    SVCB('svcb-test', 1, '.', 'port=443'),
);
