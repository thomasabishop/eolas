---
categories:
  - Programming Languages
tags:
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

With the `-e` modifier we can list more processes:

```
 PID TTY          TIME CMD
      1 ?        00:00:05 systemd
      2 ?        00:00:00 kthreadd
      3 ?        00:00:00 rcu_gp
      4 ?        00:00:00 rcu_par_gp
      5 ?        00:00:00 netns
      7 ?        00:00:00 kworker/0:0H-events_highpri
      9 ?        00:00:00 mm_percpu_wq
     11 ?        00:00:00 rcu_tasks_kthread
     12 ?        00:00:00 rcu_tasks_rude_kthread
     13 ?        00:00:00 rcu_tasks_trace_kthread
     14 ?        00:00:08 ksoftirqd/0
     15 ?        00:03:20 rcu_preempt
     16 ?        00:00:00 rcub/0
     17 ?        00:00:00 migration/0
     18 ?        00:00:00 idle_inject/0
     20 ?        00:00:00 cpuhp/0
     21 ?        00:00:00 cpuhp/1
     22 ?        00:00:00 idle_inject/1
     23 ?        00:00:00 migration/1
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

- `kill -STOP pid`
- `kill -CONT pid`
