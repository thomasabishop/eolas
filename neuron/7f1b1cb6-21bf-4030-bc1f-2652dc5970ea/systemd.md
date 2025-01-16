---
tags:
  - systems-programming
  - Linux
  - procedural
  - systemd
  - operating-systems
---

# systemd

Once the [boot process](Boot_process.md) has completed and the bootloader has
located the kernel and injected it into memory the first user space program
runs: `init` (for _initialisation_). `init` is a [daemon](Daemons.md)
[process](Processes.md) that continues running until shutdown and is
responsible for starting all the processes that are prerequisites for user
space. For example: network connections, disk access, user logins etc. `init` is
the parent of all processes: PID1. Whilst it does a lot of its work in quick
succession at boot time it is not limited to the this stage of the lifescycle
but runs continuously in reponse to new user events.

On Linux systems `systemd` is used to implement `init` and therefore `systemd`
will always be listed as PID1.

`systemd` is directly accessible from user space and provides a straightforward
way to enable/disable, start/stop system level processes

> `systemd` can track individual service daemons after they start, and group
> together multiple processes associated with a service, giving you more power
> and insight into exactly what is running on the system _How Linux Works: Third
> Edition_, Brian Ward 2021

## How systemd works

### Goal-directed units

`systemd` works on the basis of _goals_. Each goal is system task defined as a
**unit**. A unit contains instructions and a specification of dependencies to
other units.

When activating a unit, `systemd` first activates the dependencies and then
moves onto the details of the unit itself. `init` as implemented by `systemd`
does not follow a rigid sequence every time, initialising units in the same
sequence and waiting for one to complete before starting another. Instead it
activates units whenever they are ready. This, its parallelized nature, is one
of the main advantages over previous programs that managed the `init` sequence
on Linux (such as for example System V);

### Unit types

Units are organised into **unit types**. The main types that run at boot time
are as follows:

- service units (`.service`)
  - control service daemons
- socket units (`.socket`)
  - handle incoming network connection request locations
- device units (`.device`)
  - disks and other devices
- mount units (`.mount`)
  - handle the attachment of filesystems to the system
- target units
  - control other units by organising them into groups

For example, at boot, a target unit called `default.target` groups together a
number of service and mount units as dependencies. These then run in a
graph-like dependency structure where a unit that comes late in the boot process
can depend on several previous units making earlier branches of a dependency
tree join back together.

## systemd configuration files

Units are managed via `systemd` configuration files.

### Configuration file locations

System level `systemd` config files are located in the _system unit directory_
at `/usr/lib/systemd/system`. You shouldn't change or manipulate these files or
attempt to add new config files here since they will be overwritten by the
system.

![](static/systemd-global-files.png) _`systemd` global unit files_

Local definitions that relate to the specific user and where the user herself
can define units are located in the _system configuration_ directory:
`/etc/systemd/system`.

![](static/systemd-local-files.png)

_`systemd` local unit files, specific to the currently logged-in user_

### Example files

Below is the systemd service file for the creation of UUIDs:

```plain
[Unit]
Description=Daemon for generating UUIDs
Documentation=man:uuidd(8)
Requires=uuidd.socket

[Service]
ExecStart=/usr/sbin/uuidd --socket-activation
Restart=no
User=uuidd
Group=uuidd
ProtectSystem=strict
ProtectHome=yes
PrivateDevices=yes
PrivateUsers=yes
ProtectKernelTunables=yes
ProtectKernelModules=yes
ProtectControlGroups=yes
MemoryDenyWriteExecute=yes
ReadWritePaths=/var/lib/libuuid/
SystemCallFilter=@default @file-system @basic-io @system-service @signal @io-event @network-io

[Install]
Also=uuidd.socket
```

- The `Unit` section provides metadata about the unit including which `systemd`
  dependencies it has
- `Service` constitutes the main specification for the unit
- `Install` is the call to set the dependencies running before the `Service`
  functions are accessible.

## systemd operations: systemctl

The `systemctl` command is the chief way of interacting with `systemd`. You use
it to activate and deactivate services, list their status, reload the
configuration and so.

### View the dependency graph

`systemctl status` by itself will print a long list of units grouped by their
dependency relations. It will also provide some metadata about the current
systemd boot context.

### Viewing active units

Below I have listed the running units pertaining to bluetooth:

```
$ systemctl list-units | grep bluetooth
 sys-devices-pci0000:00-0000:00:14.0-usb3-3\x2d10-3\x2d10:1.0-bluetooth-hci0-hci0:3585.device                                   loaded active plugged   /sys/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10:1.0/bluetooth/hci0/hci0:3585
  sys-devices-pci0000:00-0000:00:14.0-usb3-3\x2d10-3\x2d10:1.0-bluetooth-hci0.device                                             loaded active plugged   /sys/devices/pci0000:00/0000:00:14.0/usb3/3-10/3-10:1.0/bluetooth/hci0
  sys-subsystem-bluetooth-devices-hci0.device                                                                                    loaded active plugged   /sys/subsystem/bluetooth/devices/hci0
  sys-subsystem-bluetooth-devices-hci0:3585.device                                                                               loaded active plugged   /sys/subsystem/bluetooth/devices/hci0:3585
  bluetooth.service                                                                                                              loaded active running   Bluetooth service
  bluetooth.target                                                                                                               loaded active active    Bluetooth Support
```

### List jobs

Requests to activate, reactivate and restart units are called **jobs** in
`systemd`. They can be thought of as unit state changes. Current jobs can be
listed with `systemctl list-jobs`.

This will most likely return `No jobs running` if the computer has been running
for a while. Most jobs execute at boot.

### Enable/disable, start/stop units

If a unit has dependencies it is necessary to _enable_ it before starting it.
This installs the dependencies.

```bash
systemctl enable mongodb.service
Created symlink /etc/systemd/system/multi-user.target.wants/mongodb.service → /usr/lib/systemd/system/mongodb.service.
```

Then we can start:

```
systemctl start mongodb.service
```

To stop the service:

```
systemctl stop mongodb.service
```

After this we should disable it, in order to remove any symbolic links it has
created on the system as part of the install process:

```bash
systemctl disable mongodb.service
Removed "/etc/systemd/system/multi-user.target.wants/mongodb.service".
```

## Why use systemd over cron ?

https://mark.stosberg.com/2016-08-26-rsnapshot-and-systemd/
