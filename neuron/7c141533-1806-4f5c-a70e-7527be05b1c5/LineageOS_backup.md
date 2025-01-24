---
tags: [procedural, linux, android]
created: Friday, January 24, 2025
---

# LineageOS major update procedure

## Backup

- Enable developer mode by going to Settings > About Phone and tapping "Build
  Number" seven times

- Enable USB debugging in Developer Options

- Test by running `adb devices` in PC terminal

- Then run `adb backup -apk -shared -all -system -f lineage_backup.ab`

## Download latest version of TWRP

Make sure you get the right one for Google Pixel 2 (taimen), e.g:

```
twrp-3.7.0_9-0-taimen.img
```

## Download ROM image and associated files

Go to
[https://wiki.lineageos.org/devices/taimen/](https://wiki.lineageos.org/devices/taimen/),
download zip, viz.

```
lineage-22.1-20250123-nightly-taimen-signed.zip
```

## Boot into fastboot

Press Power + Vol Down

Check connection with:

```
fastboot devices
```

## Boot into TWRP

```
fastboot boot  twrp-3.7.0_9-0-taimen.img
```

## Copy OS rom to Phone

```
adb push lineage-22*.zip /sdcard/
```

## Install OS in TWRP

In TWRP select Install > Select ROM zip

Select flash

Then reboot

```

```
