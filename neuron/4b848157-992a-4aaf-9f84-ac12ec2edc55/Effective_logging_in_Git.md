---
tags: [git, procedural]
---

# Effective logging in Git

| Root command      | Variant      | Output                                                   |
| ----------------- | ------------ | -------------------------------------------------------- |
| `git log`         | filename.txt | List the commits that changed the given file             |
| `git log --patch` | filename.txt | Show the diff changes for each commit for the given file |
| `git log --patch` | null         | Show the diff changes for each commit for all files      |
