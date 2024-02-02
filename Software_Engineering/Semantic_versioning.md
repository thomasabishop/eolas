---
categories:
  - Software Engineering
tags: []
---

# Semantic versioning

```
3.4.1 === major.minor.patch
```

- Major

  - New feature which may potentially cause breaking changes to applications
    dependent on the previous major version.

- Minor

  - New features that do not break the existing API

- Patch

  - Bug fixes for the current minor version

## Glob patterns for versioning

### Caret

Interested in any version so long as the major version remains at $n$. E.g if we
are at `^4.2.1` and we upgrade, we are ok with `4.5.3` or `4.8.2`. We are not
bothered about the minor or patch version.

This is equivalent to `4.x`

### Tilde

Interested in any patch version within set major and minor parameters. For
example `~1.8.3` means you don't mind any patch version so long as it is a patch
for `1.8`. This is equivalent to `1.8.x`.

### No tilde or caret

Use the _exact_ version specified
