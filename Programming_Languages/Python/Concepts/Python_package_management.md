---
categories:
  - Programming Languages
tags: [python, data-types]
---

# Package management

- It is better to use `conda` (the package manager that comes with `anaconda`), since this makes it easier to work with conflicting package libraries (a bit like a package lock).

- The alternative is the native `pip` but you have to create virtual environments (`venv`) to manage packages at different versions.

  It works a bit like this:

  ![](/_img/Screenshot%202023-02-13%20at%2010.43.17.png)

  To make use of virtual environments in `pip` you have to create the virtual environment before installing anything:

  ```
  python3 -m venv venv3
  source venv3/bin/activate
  pip [library_name]
  ```

- pypi.org > is package registry like NPM
