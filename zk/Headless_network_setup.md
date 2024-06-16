---
id: hb10
title: Headless network setup
tags:
  - networks
  - Linux
  - raspberry-pi
created: Wednesday, June 12, 2024
---

# Headless network setup

If you are using a headless system and you aren't using an ethernet connection,
you face a chicken-egg issue of how to connect the device to WiFi via `ssh` when
the device isn't yet on the network.

You can get around this by saving a file called `wp_supplicant.conf` to the
`/boot` directory of the device. This specifies the SSID name and password and
will be used to auto-connect when the device boots.

For example:

```
country=GB
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
     ssid="SKYVL7XP"
     scan_ssid=1
     psk="WIFI_PASSWORD"
     key_mgmt=WPA-PSK
}
```

## Related notes
