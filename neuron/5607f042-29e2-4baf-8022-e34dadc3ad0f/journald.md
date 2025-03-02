---
tags:
  - systems-programming
  - Linux
  - procedural
---

# `journald`

`journald` is a program that comes as default with [systemd](systemd.md). It is
a service for collecting and storing system-level log data. I keeps a track of
all [kernel](The_kernel.md) processes. It is invaluable when tracing the source
of problems and errors that may arise on the system level. It keeps a track of
all kernal processes.

![](static/journald.png)

## `journalctl`

We use `journalctl` to access the logs. The command by itself outputs the entire
log which will be huge and hard to scroll through. We can refine the results
with modifiers.

### View logs for a specific process with pid

```bash
journalctl _PID=1234
```

### View logs for a specific time period

This can be really helpful since you can bracket the most recent events which
will be more memorable.

```bash
journalctl -S -1h
```

### View logs for a specfic systemd unit

```bash
journalctl -u [unit_name] -e
```

### View boot logs

```bash
journalctl -b
```

#### Identify specific boot

```bash
journalctl --list-boots

```

### List only kernel entries to the journal

```bash
journalctl -k

```
