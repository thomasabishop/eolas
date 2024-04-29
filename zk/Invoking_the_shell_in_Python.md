---
id: cfr4
title: Invoking_the_shell_in_Python
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
    return json.loads(process.stdout)

except subprocess.CalledProcessError as e:
        return e.stderr.strip()
```
