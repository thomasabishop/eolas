---
id: ippn
title: Network scanning
tags: [networks, procedural, Linux]
created: Monday, June 10, 2024
---

# Network scanning

## List all connected devices on local WiFi network

```sh
arp-scan --interface=wlan0 --localnet
```

## Scan subnet for all connected devices (in case hiding)

```sh
nmap -sn 192.168.0.0/24
```

## Related notes
