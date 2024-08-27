---
title: Python_application_structure
tags: [python]
created: Tuesday, August 27, 2024
---

# Python application structure

## Directory layout

```
src/
    cli.py OR app.py
    constants.py
    __init__.py
tests/
requirements.txt
setup.py
```

## `requirements.txt`

Dependencies used within the venv for the project, e.g:

```
google-auth==1.35.0
google-auth-httplib2==0.1.0
google-auth-oauthlib==0.4.6
google-api-python-client==2.26.1
gspread==3.7.0
requests==2.25.1
oauth2client==4.1.3
```

## `setup.py`

The declaration file for the application, equivalent to `package.json`, e.g:

```py
from setuptools import setup, find_packages

setup(
    name="eolas-db",
    version="0.1",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    install_requires=[
        # List your project dependencies here
    ],
    entry_points={
        "console_scripts": [
            "eolas-db=cli:main",
        ],
    },
)
```

The `entry_points` key is important. This is the first execution point of the
application. Typically you would name your entry-point script as `app.py` or
`cli.py` and then specify its `main` function.

E.g. in `cli.py`:

```py
def main():
    print('run the application')

if __name__ == "__main__":
    main()

```

## `__init__.py`

See
[[Python_modules_and_imports#distinguishing-_modules_-from-_packages_]]|Python
modules]]
