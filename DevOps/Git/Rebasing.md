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

It is also a technique that can be used to integrate recent commits without merging.

When to use one over the other:

- **Merge** to allow commits to stand out or to be clearly grouped
- **Merge** to bring large feature branches back into main
- **Rebase** to add minor commits in a main branch into a feature branch
- **Rebase** when you need to move commits from one branch to another

So in terms of my personal workflow, I should be using

- Merge when I want to bring a feature into develop
- Merge when I want to bring develop into main for a release
- Merge any time the feature branch is already public and being used by others.
- Rebase to capture small changes in the parent branch
- Rebase when I have branched from a branch because a refactor or something has become more complex than originally anticipated.

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

When we rebase we remove the additional merge commit but we are changing history. The commits are still there but the SHAs are changed. For this reason **you should not rebase a public branch**, otherwise you will mess up your collaborators history. You should do your rebasing locally and then make a pull request.

## Difference from cherry-picking

The main difference between the two approaches is that [cherry-picking](/DevOps/Git/Cherry_picking_a_branch.md) is a more selective process, where you can pick and choose specific commits that you want to include in another branch. This can be useful when you only want to apply specific changes or fixes from one branch to another, without including all the changes made in the original branch.

On the other hand, rebasing is a more comprehensive process that can include all the changes from one branch to another, but it modifies the commit history, making it more linear and easier to understand. Unlike rebasing, cherry-picking does not modify the commit history of either branch.

## Squashing commits

This is a handy feature of rebasing. It allows you to combine multiple commits into one. This is useful when you have been doing a lot of trial and error to resolve a bug and you have lots of small commits that are not that important in themselves.

We use the interactive rebase tool for this.

Checkout the branch where the commit you want to squash is located.

Then run:

```
git rebase -i HEAD~n
```

Where `n` is the number of commits you want to squash starting from the most recent. This will open an interactive rebase window, listing the commits. You can then use the keywords to decide what you want to do with them. In our case this will be `s` for squash.

![](/_img/git-interactive-rebase.png)

## `git pull rebase`

We can use this command to combine a rebase with a pull. This way we silently update our local version of a branch with the remote, without adding a merge commit.

```
git pull --rebase
```

Add `--rebase=preserve` to keep merges that have been done _locally_. It is generally a good idea to do this.
