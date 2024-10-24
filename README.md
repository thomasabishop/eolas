# Eòlas

<img src='./img/knowledge_graph.png' width=400 align='center' /><br/>

> Eólas is Irish for knowledge or information, especially knowledge gained by
> experience or practice

This repository is my technical knowledge management system or "second-brain".
It comprises notes from my autodidactic study of software engineering and
computer science.

## Frontend

The notes can be read in a more congenial format
[here](https://thomasabishop.github.io/eolas/cfbef1c4_web_precursors). This is a
[Neuron](https://neuron.zettel.page/) static site that I generate automatically
using a small Python
[application](https://github.com/thomasabishop/neuron-zk-generator) that
executes on each push to this repository and deploys via GitHub pages.

## Implementation

It is a [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) work in
progress. I've recently converted the topic-based subdirectories into a single
flat directory structure organised by tags. I'm in the process of partitioning
longer notes into smaller units.

I use the [zk](https://github.com/zk-org/zk) CLI package to help with indexing
and task automation alongside its [zk-nvim](https://github.com/zk-org/zk-nvim)
Neovim wrapper.

## Scripts

The [scripts](/scripts) directory contains several Bash and Python scripts I use
for general housekeeping, such as formatting image URLs, removing unused assets,
and autosaving.
