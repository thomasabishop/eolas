---
tags:
  - systems-programming
  - systemd
  - Linux
  - procedural
---

# Create timed `systemd` job

To use systemd to run a bash script at 11am each day, you can create a new
systemd service file. Here is an example of what the service file might look
like:

```
[Unit]
Description=Run My Script

[Service]
Type=simple
ExecStart=/bin/bash /path/to/my_script.sh

[Install]
WantedBy=default.target
```

Save this file to `/etc/systemd/system/my_script.service`.

Then you can use systemd to schedule the script to run at 11am each day by
creating a new systemd timer file. Here is an example of what the timer file
might look like:

```
[Unit]
Description=Run My Script Daily at 11am

[Timer]
OnCalendar=*-*-* 11:00:00

[Install]
WantedBy=timers.target
```

Save this file to `/etc/systemd/system/my_script.timer`

Then you can enable and start the timer with the following commands:

```
sudo systemctl enable my_script.timer
sudo systemctl start my_script.timer
```

This will run the script at 11am everyday You can check the status of the timer
with the following command:

```
sudo systemctl status my_script.timer
```
