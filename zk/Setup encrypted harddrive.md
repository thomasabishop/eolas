---
tags: [procedural, disks, encryption]
created: Monday, February 10, 2025
---

# Setup an encrypted harddrive

Firstly [create a new partition](./Creating_a_Linux_partition_table.md) on the
unencrypted drive with `fdisk`.

Create LUKs encryption:

```sh
sudo cryptsetup luksFormat /dev/sdX
```

Enter password when prompted.

Open the encrypted drive with the name you want to use henceforth:

```sh
sudo cryptsetup luksOpen /dev/sdX my_device_name
```

Create filesystem:

```sh
sudo mkfs.ext4 /dev/mapper/my_device_name
```

Set mount point:

```sh
sudo mkdir -p /media/my_device_name
```

Mount:

```sh
sudo mount /dev/mapper/my_device_name /media/my_device_name
```

Add it to the crypttab:

```sh
vim /etc/crypttab
```

Get UUID for device with:

```
sudo blkid /dev/sdx
```

Add entry:

```txt
my_device_name UUID="ae028027-20c5-40b6-9311-11f5a886f125" none noauto
```

Then add it as a lint in the fstab for auto-mount:

```sh
/dev/mapper/my_device_name /media/my_device_name ext4 defaults,nofail,noauto,user 0 2
```

Give yourself full permissions (set once, then permanent):

```sh
sudo chown thomas:thomas /meda/my_device_name
sudo chmod 755 /media/my_device_name
```

Make sure it shows up with its intended name:

```sh
sudo e2label /dev/mapper/samsung-T3 samsung-T3
```

(Where second value is the name we want it to show as.)

Test auto-mount and loading from crypttab:

First reload `systemd`:

```sh
sudo systemctl daemon-reload
```

Then, remount all disks.

```sh
sudo mount -a
```

Should be prompted for password and disk decrypts and mounts to specified mount
point.

## Additional points

Close LUKS (if you make a mistake):

```sh
sudo cryptsetup luksClose device_name

```

Remove vendor data to unlock more space:

```sh
sudo tune2fs -m 0 /dev/mapper/samsung-T3
```
