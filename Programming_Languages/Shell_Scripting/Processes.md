---
tags:
  - Programming_Languages
  - shell
  - processes
---

# Processes (`ps`)

`ps` allows us to control [user processes](../../Operating_Systems/The_Kernel.md) from the shell.

The command in its most minimal application returns the following

```
  PID TTY       TIME     CMD
  2437 pts/2    00:00:01 zsh
  7112 pts/2    00:00:00 ps
```

<dl>
<dt>pid</dt>
<dd>Process ID: every currently running process has a unique ID<dd>
<dt>tty</dt>
<dd>The terminal device where the process is running<dd>
<dt>Time</dt>
<dd>The amount of CPU time in minutes and seconds that the process has used so far. The total amount of time that the process has spent running instructions on the processor.<dd>
<dt>cmd</dt>
<dd>The command used to run the program. Note this can change during the running of the program.<dd>
</dl>

## Modifiers

<dl>
<dt><code>ps x</code></dt>
<dd>Show all running processes<dd>
<dt><code>ps ax</code></dt>
<dd>Show all processes not just the ones you, the current user, own<dd>
<dt><code>ps u</code></dt>
<dd>Show detailed info on processes<dd>
<dt><code>ps w</code></dt>
<dd>Show full command names<dd>
</dl>

## Process termination

The general schema is: `kill [pid]`. This allows for process clean-up. If this doesn't succeed you can force with `KILL [pid]` which will terminate the process immediately but is obviously more risky. 

We can also start/stop processes with modifiers on `kill`:
* `kill -STOP pid`
* `kill -CONT pid`