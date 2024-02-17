---
tags: []
---

# Bluetooth

## Connect to devices with `bluetoothctl`

```bash
# Start bluetooth first
bluetoothctl power on
```

Then:

```bash
# Launch bluetoothctl
bluetoothctl
```

This initiates `[bluetooth] #` prompt. Then follow this sequence:

```bash
[bluetooth]# agent on
[bluetooth]# default-agent
[bluetooth]# scan on
pair [device_code]
connect [device_code]
```
