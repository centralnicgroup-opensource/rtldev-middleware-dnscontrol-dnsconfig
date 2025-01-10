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

Use ipaddress setting in case of active ip address filter settings.

```json
{
  "CNR": {
      "apilogin": "yourusername",
      "apipassword": "yourpassword",
      "apientity": "OTE", // for OT&E system; use "LIVE" for LIVE system
      // "debugmode": "0", // "1" to activate
  }
}
```
