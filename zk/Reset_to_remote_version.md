---
tags: [git, procedural]
---

# Reset to remote version of a branch

The scenario: your local Git history has become corrupted in some way and you
want a clean history based on the current state of the remote. We will
demonstrate with `main`.

```
git fetch origin
git reset --hard origin/main
```
