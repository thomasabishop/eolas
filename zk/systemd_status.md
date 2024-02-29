---
id: v5f6xkdv
title: systemd status
tags: [systemd, systems-programming]
created: Thursday, February 29, 2024 | 18:19
---

# Get status of a specific unit

Here I have requested the status of the currently running `mongodb` unit:

```
$ systemctl status mongod
mongodb.service - MongoDB Database Server
     Loaded: loaded (/usr/lib/systemd/system/mongodb.service; enabled; preset: disabled)
     Active: active (running) since Wed 2022-08-17 07:25:27 BST; 24h ago
       Docs: https://docs.mongodb.org/manual
   Main PID: 931 (mongod)
     Memory: 304.1M
        CPU: 2min 18.630s
     CGroup: /system.slice/mongodb.service
             └─931 /usr/bin/mongod --config /etc/mongodb.conf
Aug 17 07:25:27 archbish systemd[1]: Started MongoDB Database Server.****
```

In addition to the core info it tells us the unit type. In this case it is a
service.

We can also view the journal entry for the given unit. This provides you with
its diagnostic log messages:

```
journalctl --unit=mongodb.service
- Boot b9565dfe8aca4d069143209b3aa84d8e --
Aug 05 18:31:30 archbish systemd[1]: Started MongoDB Database Server.
Aug 06 14:27:33 archbish systemd[1]: mongodb.service: Deactivated successfully.
Aug 06 14:27:33 archbish systemd[1]: mongodb.service: Consumed 3min 17.598s CPU time.
-- Boot 01922f84c3bd4b3a8f11824cf05f7320 --
Aug 07 11:58:09 archbish systemd[1]: Started MongoDB Database Server.
Aug 08 14:43:01 archbish systemd[1]: mongodb.service: Deactivated successfully.
Aug 08 14:43:01 archbish systemd[1]: mongodb.service: Consumed 5min 28.760s CPU time.
-- Boot e52b735e115c43bdad8c00462aaff395 --
Aug 10 13:13:22 archbish systemd[1]: Started MongoDB Database Server.
Aug 11 07:46:40 archbish systemd[1]: mongodb.service: Deactivated successfully.
Aug 11 07:46:40 archbish systemd[1]: mongodb.service: Consumed 2min 16.629s CPU time.
```

Each entry is organised around specific boots.
