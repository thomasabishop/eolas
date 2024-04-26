---
id: 5043
title: NodeJS_scripts
tags: [node-js]
created: Friday, April 26, 2024
---

# NodeJS_scripts

If we want to use NodeJS as a scripting language without going to the trouble of
setting up an NPM-based development environment, we can use the following
architecture

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

This obviously requires NodeJS to be in your path and executable privileges.

The key part is the module check at the bottom which makes the script file
invocable.
