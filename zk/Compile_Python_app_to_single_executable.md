---
tags: [python, procedural]
created: Saturday, October 19, 2024
---

# Compile Python app to single executable

Assume you are already using a Pip venv.

Install `pyinstaller` and/or add it to your `requirements.txt`:

```sh
souce venv/bin/activate
pip install pyinstaller
pip install -r requirements.txt
```

Then from root of project:

```sh
pyinstall -F src/app.py
```

The `-F` flag compiles the application to a single file containing all necessary
external packages and local imports.

It outpute to `/dist`. Say the app is called `hello`, run the executable thus:

```sh
/my-python-application/dist/my-app
```

To run this as the package name (e.g. `my-app --option`):

```
sudo mv /my-python-application/dist/app /usr/local/bin
```

When overwriting/ publishing a new version:

```
sudo rm -rf /usr/local/bin/my-app
```

and repeat above.
