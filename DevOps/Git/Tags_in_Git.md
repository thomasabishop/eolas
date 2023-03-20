---
categories:
  - DevOps
tags: [git]
---

# Tags in Git

Tags exist to reference specific commits in a more meaningful way than using a SHA reference. They are a **named reference to a commit**. As they refer to a singular commit they do not update but are a fixed point in the Git history.

> Tags do not care about branches. They are an objective reference to a commit regardless of which branch it occured on. You can reference a tag without needing to be in the branch where the tagging originally took place.

Tags are frequently used to mark software release versions. But they can also be used for other designations such as the addition of a key feature or bug.

## Creating a tag

```
git tag -am "Version 1.0" v1.0 dd5c4539a0
```

`am` is for "annotated + message". The actual tag name is `v1.0`

Now you can refer to that commit with `v1.0` rather than use the SHA

## Deleting a tag

```
git tag -d v1.0
```

> When you delete the tag you are only deleting the tag reference not the commit that it refers to.

## Listing tags

```
git tag --list
```

## Examples of use

```
git show v1.1

git diff v1.0..v1.1
```

## Pushing tags to a remote

In the examples so far, all the tags have been **local tags**. They only exist in our local workflow and are not accessible to our collaborators. If we do a `git push`, this doesn't transfer our local tags.
