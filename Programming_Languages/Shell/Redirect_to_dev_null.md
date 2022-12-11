---
categories:
  - Programming Languages
tags:
  - shell
---

# Redirecting to `/dev/null`

You'll see the following a lot when reading shell scripts:

```bash
[some_command] > /dev/null 2>&1

```

This is a redirection statement. It is redirecting data to the `null` device on Unix systems. Basically to a black hole or shredder where you can't access it because you don't want it to be output to stout.

The `2>&1` argument is the content: any errors that the program may generate and try to show in stout.

## Example

I have used this in my Mongo start-up script:

```
mongodb-compass > /dev/null 2>&1
```

Here, I just want the MongoDB Compass application to start, I don't care if it wants to output complaints to the stout.
