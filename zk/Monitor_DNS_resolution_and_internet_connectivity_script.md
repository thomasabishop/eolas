---
tags: [procedural, networks]
created: Saturday, January 04, 2025
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
