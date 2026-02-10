# dnscontrol-dnsconfig

DNS configuration for test / demo purposes of our provider module.

## Supported Record Types

| Type  | Status      | Notes                                    |
|-------|-------------|------------------------------------------|
| A     | Supported   |                                          |
| AAAA  | Supported   |                                          |
| ALIAS | Supported   |                                          |
| CAA   | Supported   |                                          |
| CNAME | Supported   |                                          |
| DHCID | **New**     | RFC 4701 — DHCP identifier              |
| DNAME | **New**     | RFC 6672 — subtree delegation            |
| LOC   | **New**     | RFC 1876 — geographical location         |
| MX    | Supported   |                                          |
| NAPTR | Supported   |                                          |
| NS    | Supported   |                                          |
| PTR   | Supported   |                                          |
| SRV   | Supported   |                                          |
| SSHFP | Supported   |                                          |
| SVCB  | **New**     | RFC 9460 — service binding               |
| TLSA  | Supported   |                                          |
| TXT   | Supported   |                                          |

## Usage

Preview changes that would be submitted:

```bash
dnscontrol preview
```

Push the changes to your providers:

```bash
dnscontrol push
```

## Building from Source

```bash
cd rtldev-middleware-dnscontrol && go build -buildvcs=false -o ../ && cd ..
```

## Running Integration Tests

```bash
# Standard integration tests
bash tests/integration.sh

# Integration tests with diff2
bash tests/integration_diff2.sh
```

## Example configuration

Use ipaddress setting in case of active ip address filter settings.

```json
{
  "CNR": {
      "apilogin": "yourusername",
      "apipassword": "yourpassword",
      "apientity": "OTE", // for OT&E system; use "LIVE" for LIVE system
      // "debugmode": "0", // "1" to activate
      "domain": "yourtestdomain.com"
  }
}
```
