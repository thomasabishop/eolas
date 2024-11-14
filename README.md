# eòlas

This repository is my technical knowledge management system,
[zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) or "second-brain",
comprising notes from my study of software engineering and computer science.

The notes can be read in a more congenial format
[online](https://thomasabishop.github.io/eolas).

## Related projects

### [neuron-zk-generator]()

Converts notes in this repository into a format that can be compiled into a
[Neuron](https://neuron.zettel.page/) project and published to the Web.

### [eolas-db]()

A database for the entries which I use to track changes and relations between
notes. Also serves as the back-end for further transformations/utilities.

## Scripts

The [scripts](/scripts) directory contains several Bash and Python scripts I use
for general housekeeping, such as formatting image URLs, removing unused assets,
and autosaving.

### `auto-commit.sh`

This is the main script for managing the project:

- standardises file names and purges unused resources
- compiles the Neuron version of the project, writing to the `/neuron`, which is
  then deployed to the Web via GitHub actions and GitHub pages
- triggers the reindexing of the `eolas-db` database
- commits all changes to this repository with a timestamp
