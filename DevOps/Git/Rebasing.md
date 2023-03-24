---
categories:
  - DevOps
tags:
  - git
---

# Rebasing

Rebasing is a way to integrate changes from one branch into another. In this regarding it is like merging a branch B into another branch A. However rebasing differs from normal merging in the way in which it modifies the Git history.

In a normal merge of branch B into branch A, Git creates a new commit that combines the changes of branches B and A. This is known as the merge commit and is evident from the following automatic commit message that is generated:

```
Merge branch B of github.com:thomasabishop/remote-repository into A
```

![](/_img/normal-merge-again.svg)

In this scenario the merge commit has two or more parent commits each representing the history of the merged branches. The resulting history of A will include the commits of B. Basically the two histories are combined.

This would give us a history that looks like the following, with different colours for the separate SHAs of each merged branch:

![](/_img/combined-merge-hist.svg)

If we were to create a rebase branch of A from B, there would be a new singular history without distinguishing multiple parents that combines the commits of A and B. The rebased branch's commits are recreated with new commit IDs and new timestamps, based on the current state of the branch that you are rebasing onto. This is obviously potentially destructive because it does not preserve the respective branch's separate history. It rewrites history as a continuous stream of commits in a single branch.

When a rebase is applied, it will put the diverging B commits at the tip of A like so:

![](/_img/rebase-tip-chage.svg)

And then rebrand the previous A commits to be continuous with B presenting a flat and linear Git history like the following:

![](/_img/single-git-history-rebase.svg)

## Benefits, use-cases

> The purpose of rebasing is to ensure that the commit history of a project is as linear and simple as possible, by incorporating changes from one branch into another, as if the changes had been made on the other branch all along.

A common use-case is with feature branches as it makes the features fit more seamlessly with the `main` or `develop` branch.

It is also a technique that can be used to integreate recent commits without merging.

## Syntax

For example if we are working on a feature branch off of `main`, we would run the following from this feature branch:

```
git rebase main
```

This will move the feature branch to the tip of `main`.

If this completes successfully, we would then go on to merge the feature with main.

If conflicts occur, the rebase will halt. You fix the conflicts and then run:

```
git rebase --continue
```

Or if you don't want to resolve the conflict (not advised):

```
git rebase --skip
```

Or stop the whole process:

```
git rebase --abort
```

### Isolate the point at which one branch diverges from another

This can be useful to check before you create a rebase:

```
git merge-base main feature/some-feature

c33acc84f06fcb94e0e87d9adb240c038da6d71c
```

## Golden rule of rebasing

## Difference from cherry-picking

The main difference between the two approaches is that [cherry-picking](/DevOps/Git/Cherry_picking_a_branch.md) is a more selective process, where you can pick and choose specific commits that you want to include in another branch. This can be useful when you only want to apply specific changes or fixes from one branch to another, without including all the changes made in the original branch.

On the other hand, rebasing is a more comprehensive process that can include all the changes from one branch to another, but it modifies the commit history, making it more linear and easier to understand. Unlike rebasing, cherry-picking does not modify the commit history of either branch.
