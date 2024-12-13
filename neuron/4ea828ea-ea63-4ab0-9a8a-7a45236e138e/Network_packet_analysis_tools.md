---
tags: [networks, procedural]
created: Friday, December 13, 2024
---

# Network packet analysis tools

- `tcpdump`: View raw packet data (`tcpdump -i wlan0 -XX` for full packet
  contents)
- tshark: Wireshark's CLI for detailed packet analysis (`tshark -i wlan0 -V`)
- `nethogs`: Monitor per-application network usage
- `iftop`: Show bandwidth usage per connection
