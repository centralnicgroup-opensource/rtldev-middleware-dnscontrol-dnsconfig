# dnscontrol-dnsconfig

DNS configuration for test / demo purposes of our provider module

Preview changes that would be submitted:

```bash
dnscontrol preview
```

Push the changes to your providers:

```bash
dnscontrol push
```

## Example configuration

```json
{
  "hexonet": {
      "apilogin": "test.user",
      "apipassword": "test.passw0rd",
      "apientity": "1234",
      // "debugmode": "0", // "1" to activate
      // "ipaddress": "172.3.25.16" // set your outgoing ip
  }
}
```