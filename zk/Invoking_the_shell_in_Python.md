---
id: cfr4
tags: [python, shell]
created: Monday, April 29, 2024
---

# Invoking the shell_in_Python

```py
import subprocess

try:
    process = subprocess.run(
        ["ls", "-la"],
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return process.stdout

except subprocess.CalledProcessError as e:
        return e.stderr.strip()
```
