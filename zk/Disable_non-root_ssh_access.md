---
tags: [server-management, ssh, procedural, linux]
created: Saturday, February 15, 2025
---

# Disable non-root SSH access

Best practice is to:

- Disallow root login
- Block password-based login
- Allow only SSH-based login

Do this by editing `/etc/ssh/sshd_config`:

```
PasswordAuthentication no
ChallengeResponseAuthentication no
```

Then restart the SSH service:

```
sudo systemctl restart sshd
```

(Assumes you have already set-up SSH-based login for a non-root user!)
