---
id: l29u
title: Time_and_computers
tags: [unix]
created: Sunday, April 28, 2024
---

# Time and computers

## Epochs and Unix Time

An epoch is a period of time identified by a starting point.

The standard epoch for measuring against is known colloqially as "Unix Time":
midnight on 1st January 1970. Unix time is the number of seconds that have
elapsed since this point. This is the standard for Windows and most unix
systems.

For example midnight on 2nd January 1970 would be 86400 seconds since the epoch.
The deduction is as follows:

```
60 * 60 * 24 = 86400
```

We are multiplpying the number of seconds in a minute by the number of minutes
in an hour by the number of hours in a day.

To represent times and dates before 1970, we use negative integers.

## UTC and time zones

"Coordinated Universal Time" (UTC) is the time standard against which the
world's timekeeping is synchronized. It is not itself a timezone, it is a
transcendent standard that defines what time zones are.

Time zones are defined relative to UTC, by their offset to this value.

For example North America is behind UTC by five or six hours hence uses the
notation UTC-5:00 or UTC-6:00.

UTC is the successor to GMT of which there were variances necessitating a
universal value. Despite this GMT is equal to UTC+00:00 so apart from when
daylight saving is in effect in the UK, GMT = UTC.

Depending on your locale, relative to UTC, you will get different outputs when
you attempt to log Unix Time.

Also daylight savings can impact on the outputs. For instance for half of the
year, when DST applies, the UK is UTC+01:00.

## Examples in Python

The following gives us the unix seconds in my current time zone (GMT DST):

```py
import time
print(time.time())
# 1714322393.2929392
```

If I want UTC, I can do:

```py
import datetime
print(datetime.datetime.utcnow().strftime('%s'))
# '1714318952'
```

We see clearly that they are not identical.
