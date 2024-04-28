---
id: 5043
title: NodeJS_scripts
tags: [node-js]
created: Friday, April 26, 2024
---

# NodeJS_scripts

If we want to use NodeJS as a scripting language without going to the trouble of
setting up an NPM-based development environment, we can use the following
architecture.

```js
#!/usr/bin/env node

const process = require("process");

const actualScript = (firstParam, secondParam) => {
  // Do something
};

if (require.main === module) {
  const [, param1, param2] = process.argv;
  actualScript(param1, param2).catch(console.error);
}
```

Basically we have a function that contains the main actions of the script. This
is then invoked within `main` in the manner of a Bash or
![Python script](./Single_file_Python_scripts.md)

This obviously requires the Node binary to be in your path and the script must
be run with executable privileges.

The module check at the bottom which makes the script file invocable.
