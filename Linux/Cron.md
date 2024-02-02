---
categories:
  - Programming Languages
  - Linux
tags:
  - shell
---

# Cron

## `cronie`

In Arch Linux I use `cronie` for cron jobs. (There is no cron service installed
by default). Install `cronie` and then enable it in systemd with: lorem ipsum
dolar sit avedfdfdfdfd dfdfdfdfdfdfd dfdfdfdfdfdfdfdfdfdf

```bash
systemctrl enable --now cronie.service
```

## commands

### List cron jobs

```
crontab -l
```

### Open cron file

```
crontab -e
```

### Check cron log

```bash

journalctl | grep CRON
# Different distros have different loggers
```

## Syntax

```bash
m h d mon dow command
# minute, hour, day of month, day of week, bash script/args
# 0-59, 0-23, 1-31, 1-12, 0-6
```

**Examples**

Run on the hour every hour

```
0 * * * * mysqlcheck --all-databases --check-only-changed --silent
```

At 01:42 every day:

```
42 1 * * * mysqlcheck --all-databases --check-only-changed --silent
```

Every half hour:

```
0,30 * * * * ${HOME}/bash_scripts/automate_commit.sh

```

**Shorthands**

- `@reboot` – Run once, at startup
- `@yearly` – Run once a year, “0 0 1 1 \*”.\</>
- `@annually` – same as @yearly
- `@monthly` – Run once a month, “0 0 1 \* \*”
- `@weekly` – Run once a week, “0 0 \* \* 0”
- `@daily` – Run once a day, “0 0 \* \* \*”
- `@midnight` – same as @daily
- `@hourly` – Run once an hour, “0 \* \* \* \*”

**Examples**

```
@hourly mysqlcheck --all-databases --check-only-changed --silent

```

**View the logs**

```bash
sudo grep crontab syslog

```
