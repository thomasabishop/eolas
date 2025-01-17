---
tags: [javascript]
created: Sunday, November 24, 2024
---

# JavaScript module types

The following info is useful when you wish to use modern JavaScript tooling
outside of a build system.

For instance I wanted to use a bundled React application in a static website not
created using NPM.

Great account by
[Julia Evans](https://jvns.ca/blog/2024/11/18/how-to-import-a-javascript-library/).

In essence there are three main module formats:

- CommonJS

  - Native Node JS module system using `require()` and `module.exports()`

- ESModules

  - The defacto standard that works in both the browser and Node.js

- AMD

  - A browser-friendly version of CommonJS since superseded by ESModules

Then there is UMD, _Universal Module Definition_. This is a wrapper that
combines compatibility for multiple module systems and works with AMD, CommonJS,
as well as global variables.
