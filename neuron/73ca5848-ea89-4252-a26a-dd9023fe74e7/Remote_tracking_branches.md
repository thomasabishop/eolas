---
tags: [git]
---

# Remote tracking branches

A remote tracking branch is a **local** snapshot or reference to the state of a
branch on a remote repository.

When you clone a remote repository, Git automatically creates remote tracking
branches for all the branches on the remote repository.

The remote tracking branches have the prefix `origin/` followed by the name of
the remote branch. For example, if you clone a repository with a branch named
`develop`, Git creates a remote tracking branch named `origin/develop`.

When you use commands like `git fetch` and `git pull`, you are interacting with
the remote repository and having it reflected in the remote tracking branches.

For instance, `git fetch` makes the remote tracking branch reflect the remote
changes so that you have a local copy.

The remote tracking branch is not the same as a local branch. A local branch is
a branch that may or may not exist on the remote. Once it has been pushed to the
remote repository, a remote tracking branch will be created for its remote
version. When you make local changes, the snapshot of the remote tracking branch
will no longer be up to date: your local branch will be "ahead" of it. Once you
push, the remote tracking branch snapshot is update and reflects the local state
of the branch and the two are in sync again.

The same is true of remote branches. When you checkout a remote branch, your
local version of it reflects a remote tracking version of it. This goes out of
sync with your local version when changes are made on the remote.
