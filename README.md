# Eólas

> Eólas is Irish for knowledge or information, especially knowledge gained by
> experience or practice

This repository is my technical knowledge management system or "second-brain".
It comprises notes from my autodidactic study of software engineering and
computer science.

## Implementation

It is a [Zettelkasten]() work in progress. I've recently converted the
topic-based subdirectories into a single flat directory structure organised by
tags. I'm in the process of partitioning longer notes into smaller informational
units.

I use the [zk](https://github.com/zk-org/zk) CLI package to help with indexing
and task automation alongside its [zk-nvim](https://github.com/zk-org/zk-nvim)
Neovim wrapper. I occassionally utilise [Obsidian](https://obsidian.md/)
alongside Neovim for when I want to view my notes as a knowledge graph or read
them alongside their rich content (images, videos etc).

## Commands

Commands are local to my Linux machine, specified in my
[dotfiles](https://github.com/thomasabishop/dotfiles). They are how I generate
new entries and manage the knowledge base.

| Alias         | Command                | Output                                                                                    |
| ------------- | ---------------------- | ----------------------------------------------------------------------------------------- |
| `z`           | `cd $HOME/repos/eolas` | Access Zettelkasten                                                                       |
| `zn`          | `zk new --title ...`   | Create new entry from template                                                            |
| `<leader> zi` | `:ZkIndex`             | Index Zettelkasten within `nvim`                                                          |
| `<leader> zt` | `:ZkTags`              | View tags via [Telescope](https://github.com/nvim-telescope/telescope.nvim) within `nvim` |
| `<leader> zl` | `:ZkLinks`             | View links in current entry via Telescope within `nvim`                                   |
| `<leader> zb` | `:ZkBacklinks`         | View backlinks to current entry via Telescope within `nvim`                               |

// what about viewing all zets from another dir?

## Frontmatter

When I run the `zn` command this generates a new Zettelkasten entry with the
following frontmatter template:

```yaml
---
id: o8yzcrtv
title: test
tags: []
date: Saturday, February 17, 2024 | 17:44
since: just now
---
```

## Scripts

The [scripts](/scripts) directory contains several Bash and Python scripts I use
for general housekeeping, such as formatting image URLs, removing unused assets,
and automating commits.

## Autosave

I use a [bash script](./scripts/auto_save.sh) to create autosave functionality
via Git. This script runs every 15 minutes via a [systemd](https://systemd.io/)
timer. It tidies up the directory (removes unused images, ensures all file names
use underscores rather than spaces and hyphens etc) and also runs the indexation
command then commits and pushes to GitHub.
