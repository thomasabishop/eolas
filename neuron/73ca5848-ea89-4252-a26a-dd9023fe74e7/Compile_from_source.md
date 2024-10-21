---
tags: [Linux, procedural]
---

# Compile package from source

1. Clone the repo from GitHub
2. `cd` into the repo
3. Run `makepkg -c`

## Remove compiled package

1. If `build` dir still exists for package try running `make uninstall`.
2. Reinstall the package and run `make uninstall`
3. Locate the installed package in `/usr/local/bin` and run `sudo rm -rf`
