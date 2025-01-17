---
tags: [git]
---

# Stale branches and pruning

A **stale branch** is a
[remote tracking branch](Remote_tracking_branches.md) that **no
longer tracks anything** because the actual branch on the remote has been
deleted.

If _you_ delete the remote branch, the remote tracking branch will also be
deleted. However if a _collaborator_ deletes the remote branch, your remote
tracking branch will remain, becoming a stale branch.

In order to get rid of it, we need to manually remove it. We can do this with
the general `prune` command:

```sh
git remote prune origin

# or run a preview of the action

git remote prune origin --dry-run
```
