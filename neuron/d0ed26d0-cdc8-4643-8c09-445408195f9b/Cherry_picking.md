---
tags:
  - git
---

# Cherry-picking a commit

Cherry-picking is the act of selecting a specific commit or set of commits and
applying them to a different branch. It allows you to extract a change or a
series of changes from one branch and apply them to another branch without
merging the entire branch.

It can also be used to apply a series of commits that are not sequential in a
branch to another branch in a specific order.

Cherry-picking can sometimes result in conflicts, especially if the changes
you're trying to apply conflict with changes in the destination branch. In such
cases, you'll need to resolve the conflicts manually before completing the
cherry-pick process.

## Syntax

Suppose you have two branches: `main` and `feature`. You want to apply the
changes from the commit with hash `xyx` from the `main` branch to the `feature`
branch.

First, switch to the `feature` branch:

```
git checkout feature
```

Next, cherry-pick the commit from the `main` branch:

```
git cherry-pick xyz
```

This will apply the changes from the commit with hash `xyz` from thee `main`
branch to the `feature` branch. This will create a new SHA on `feature` (pqr)
but the changes will be identical.

![](/static/cherry-pick.svg)

The benefit is that you only take the select changes you want, you are not
merging the whole `main` branch into feature.

Note that you can also cherry-pick multiple commits by specifying their hashes
separated by spaces:

```
git cherry-pick abcdefg hijklmn opqrst
```

## Limitations

- You don't have to just cherry-pick locally, you can also cherry-pick from a
  [remote tracking branch](Remote_tracking_branches.md).
- You cannot cherry-pick merge commits since these commits do not implement a
  set of changes, they are connecting commits.

## Use case

The time when I have cherry-picked is when a commit has been reverted via
GitHub. This typically happens on the `main` branch when breaking changes have
been merged and we want to undo this by reverting back to the previous commit,
from before the problematic commit was merged in.

In this scenario, you will want to start from the reverted `main` branch and
then cherry-pick the breaking commit. You can then fix the bug and keep an
accurate record of the whole history.
