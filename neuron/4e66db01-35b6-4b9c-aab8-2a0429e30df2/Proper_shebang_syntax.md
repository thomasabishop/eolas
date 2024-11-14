---
tags:
  - shell
---

# Proper shebang syntax

This is a more portable way of writing the shebang because the location of Bash
on different systems can vary.

```bash
#!/usr/bin/env Bash
```

Rather than:

```bash
#!/bin/bash
```
