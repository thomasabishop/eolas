---
tags: [git]
---

# Interactive staging

With interactive staging we can stage sub-portions of files rather than the
whole file. This makes commits much more targetted and atomic.

## Basic use

We enter interactive mode with:

```
git add -i
```

This opens an interface:

![](/static/git-interactive-mode-2.png)

We select 2 and it lets us stage by number. If I enter 1, it will stage the
first change.

If we then go into 3 for revert, we can undo what we have staged.

> Note that untracked files are not automatically added to the changes. We have
> to manually add them with 4 ("add untracked").

> Interactive mode doesn't commit anything, it is only for staging.

## Working with patches and hunks

There's not much utility in interactive mode if you are commiting whole files.
You can just use `git add [file]` and not bother with it.

But it is useful for staging sub-portions of a file, which are called **hunks**.

We access these via **patch mode**:

![](/static/git-patch-mode.png)

### Splitting hunks

Git will try to suggest the best hunks it can but these will sometimes not
reflect the changes you want. Sometimes they will reflect multiple changes
rather than a single change.

So long as there is an unchanged line between the different changes that it has
selected as a hunk you can split the hunk further. You just hit `s` in patch
mode, and it will repeatedly split the hunk each time until you get what you
want.

This is still an automated process and you may not find that the splitting
results in a hunk you want to commit. In this case you can use manual splitting
mode. We enter this with `e`.

This will oped up Vim for the manual work to be done:

![](/static/git-manual-hunk.png)

We use the diff symbols `+`, `-` and space to do this.

### Accessing patch mode directly

If we just want to go straight to patch mode, without anything else:

```
git add -p
```

We can also work with patches in the following commands:

```
git stash -p
git reset -p
git restore -p
git commit -p
```
