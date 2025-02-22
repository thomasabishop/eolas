---
tags: [shell]
created: Wednesday, February 19, 2025
---

# Associative arrays (lookup maps) in Bash

```sh

declare -A CHANNEL_TO_WEBHOOK # Declare the map type

# Specify key values
CHANNEL_TO_WEBHOOK["test"]=$SLACK_WEBHOOK_TEST
CHANNEL_TO_WEBHOOK["backups"]=$SLACK_WEBHOOK_BACKUPS
CHANNEL_TO_WEBHOOK["eolas"]=$SLACK_WEBHOOK_EOLAS
CHANNEL_TO_WEBHOOK["website"]=$SLACK_WEBHOOK_SYSTEMS_OBSCURE
CHANNEL_TO_WEBHOOK["time-tracking"]=$SLACK_WEBHOOK_TIME_TRACKING

# Invoke

WEBHOOK=${CHANNEL_TO_WEBHOOK[$CHANNEL]}

```
