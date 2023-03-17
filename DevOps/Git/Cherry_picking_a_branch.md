---
categories:
  - DevOps
tags:
  - git
---

# Cherry-picking a commit

Cherry-picking is the act of selecting a specific commit or set of commits and applying them to a different branch. It allows you to extract a change or a series of changes from one branch and apply them to another branch without merging the entire branch.

It can also be used to apply a series of commits that are not sequential in a branch to another branch in a specific order.

Cherry-picking can sometimes result in conflicts, especially if the changes you're trying to apply conflict with changes in the destination branch. In such cases, you'll need to resolve the conflicts manually before completing the cherry-pick process.

## Syntax

Suppose you have two branches: `main` and `feature`. You want to apply the changes from the commit with hash `abcdefg` from the `feature` branch to the `main` branch.

First, switch to the `main` branch:

```
git checkout main
```

Next, cherry-pick the commit from the `feature` branch:

```
git cherry-pick abcdefg
```

This will apply the changes from the commit with hash `abcdefg` to the `main` branch.

Note that you can also cherry-pick multiple commits by specifying their hashes separated by spaces:

```
git cherry-pick abcdefg hijklmn opqrst
```

## Use case

The time when I have cherry-picked is when a commit has been reverted via GitHub. This typically happens on the `main` branch when breaking changes have been merged and we want to undo this by reverting back to the previous commit, from before the problematic commit was merged in.

In this scenario, you will want to start from the reverted `main` branch and then cherry-pick the breaking commit. You can then fix the bug and keep an accurate record of the whole history.
