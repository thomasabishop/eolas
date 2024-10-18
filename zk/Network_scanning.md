---
id: ippn
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

## Check DNS resolution

```sh
dig google.com
```

Key output:

```
;; Query time: 6 msec
;; SERVER: 192.168.0.4#53(192.168.0.4) (UDP)
;; WHEN: Wed Jun 12 18:27:27 BST 2024
;; MSG SIZE  rcvd: 55
```
