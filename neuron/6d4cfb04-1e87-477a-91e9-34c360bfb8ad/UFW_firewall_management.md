---
tags: [server-management, procedural, linux, firewalls]
created: Sunday, February 16, 2025
---

# UFW firewall management

`ufw` (Uncomplicated Firewall) simplifies the process of setting up firewalls on
your server, without directly using `iptables`.

```sh
sudo apt install ufw
```

First we deny all incoming requests as the default:

```sh
ufw default deny incoming
```

And allow all outgoing requests as the default:

```sh
ufw default allow outgoing
```

Next we need to allow certain requests based on their port:

| Port | Service | Rule  |
| ---- | ------- | ----- |
| 22   | SSH     | allow |
| 80   | HTTP    | allow |
| 443  | HTTPS   | allow |

```sh
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

Enable:

```sh
ufw enable
```

Verify rules:

```sh
ufw status --verbose
```

```

```
