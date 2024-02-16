---
categories:
  - DevOps
tags: [git]
---

# Bisect

Bisect can be used to identify commits that introduce a bug or regression in our
code.

It is most useful for when we know there is a problem in the code and we know
there was a point in the past where the bug did not exist. We can compare the
two points and try to identify where things went wrong.

We mark the last good revision and the first bad revision. Bisect will the reset
the code to the midpoint between the good and bad versions and let you test it.
You mark that as a good or bad version and then bisect repeats the process.

![](/_img/git-bisect.svg)

## Procedure

```
git bisect start

git bisect good <SHA, tag, branch>

git bisect bad <SHA, tag, branch>
```
