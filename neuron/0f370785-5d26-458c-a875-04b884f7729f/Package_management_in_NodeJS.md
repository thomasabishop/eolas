---
tags:
  - node-js
---

# Package management

## List installed packages

```bash
npm list
```

This will return a recursive tree that lists dependencies, dependences of
dependencies, ... and so on. To limit the depth you can add the `--depth=` flag.
For example to see only your installed packages and their versions use
`npm list --depth=0`.

## View `package.json` data for an installed package

We could go to the NPM registry and view details or we can quickly view the
`package.json` for the dependency with the command `npm view [package_name]`

We can pinpoint specific dependencies in the `package.json`, e.g.
`npm view [package_name] dependencies `

## View outdated modules

See whether your dependency version is out of date use `npm outdated`. This
gives us a table, for example:

![Pasted image 20220411082627.png](/static/Pasted_image_20220411082627.png)

- _Latest_ tells us the latest release available from the developers
- _Wanted_ tells us the version that our `package.json` rules target. To take
  the first dependency as an example. We must have set our SemVer syntax to
  `^0.4.x` since it is telling us that there is a minor release that is more
  recent than the one we have installed but is not advising that we update to
  the latest major release.
- _Current_ tells us which version we currently have installed regardless of the
  version that our `package.json` is targeting or the most recent version
  available.

## Updating

`npm update` only updates from _current_ to _wanted_. In other words it only
updates in accordance with your caret and tilde rules applied to
[semantic versioning](Semantic_versioning.md).
