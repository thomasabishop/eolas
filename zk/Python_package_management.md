---
tags: [python, data-types]
---

# Package management

- You can use `conda` (the package manager that comes with `anaconda`). This
  makes it easier to work with conflicting package libraries (a bit like a
  package lock).

- The alternative is the native `pip` but you have to create virtual
  environments (`venv`) to manage packages at different versions.

To make use of virtual environments in `pip` you have to create the virtual
environment before installing anything:

```
python3 -m venv venv
```

This will create a `venv` directory in your project that will manage the
handling of modules.

> This is especially important in ArchLinux since without a virtual environment
> it will ask you to install packages with `pacman` which is annoying for local
> packages.

You then activate the environment with:

```
source venv3/bin/activate
```

Now you can install packages:

```
pip [library_name]
```

## requirements.txt

The `requirements.txt` file is similar to the `package.json` in Node projects.

Each line of the `requirements.txt`` file specifies a package that your project
depends on and, optionally, the desired version of that package. When you share
your project with others or move it between different environments (e.g., from
development to production), this file makes it easy to set up your environment
with the right dependencies.

### Example

```
Flask==1.1.2
requests>=2.24.0
numpy~=1.19.2
pandas
```

### Generate requirements file

```
pip freeze > requirements.txt

```

## Pypy

- pypi.org is package registry like NPM
