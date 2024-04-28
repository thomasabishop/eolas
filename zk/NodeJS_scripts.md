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

If you use any module not in the Node core, you will need to have this installed
globally for it to work. (There are
[ways around this](https://thom4.net/2014/self-contained-node-scripts/) for Node
scripts you publish but for personal scripts this doesn't matter.)

## `require.main`

This construction checks that the script is being directy invoked via the 'node'
command in the terminal rather than called by another module.

This is equivalent to the [following construct]() in Python:

```py
if __name__ == "__main__":
```
