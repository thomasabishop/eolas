---
tags: [git]
---

# Identify merged branches

```sh
# View merged
git branch --merged

# View merged remote
git branch -r --merged

# View unmerged
git branch --no-merged

# View unmerged remote

git branch -r --no-merged
```

The above cases run the merge check from the point of view of HEAD as this is
the default.

But we can also run it from any branch.

```
git branch --merged non_head_branch
```

## Demonstration

We have the following branches

```
git branch

* main
key_feature
another_feature
```

The branches other than `main`, have not been merged:

```
git branch --merged

* main
```

Just to confirm:

```
git branch --no-merged

key_feature
another_feature
```
