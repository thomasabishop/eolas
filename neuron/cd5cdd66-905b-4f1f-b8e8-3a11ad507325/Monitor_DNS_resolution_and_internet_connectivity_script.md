---
tags: [networks, procedural]
created: Monday, January 13, 2025
---

# Monitor DNS resolution and internet connectivity script

```bash
 while true; do
    date
    echo "DNS check:"
    host google.com
    echo "Ping check:"
    ping -c 1 google.com | grep "time="
    echo "---"
    sleep 5
done
```

See [ping](./Ping.md) for more details on what this is doing.

The `host` command contacts a DNS server and does a reverse lookup for the
IP-address of the human-readable domain name.
