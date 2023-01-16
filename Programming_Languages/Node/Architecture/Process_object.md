---
categories:
  - Programming Languages
tags:
  - backend
  - node-js
---

# The `process` object in Node.js

`process` is a global object accessible from anywhere in a Node application. It contains functionality that allows us to interact with information about the current process instance.

For example, we can use it to get environment information, read environment variables, communicate with the terminal and exit the current process.

## Managing runtime environments

See [Managing Environments](/Programming_Languages/Node/Architecture/Managing_environments.md).

## Accessing arguments: `process.argv`

We can use `process.argv` to return an array containing the command-line arguments passed when a Node process was launched. This could be a whole-app entrypoint (i.e. `index.js`) or a single file we are running.

For instance if we run the following file:

```js
// process-demo.js
console.log(3 + 3);
console.log(process.argv);
```

We get:

```bash
6
[
  '/Users/thomasbishop/.nvm/versions/node/v16.10.0/bin/node',
  '/Users/thomasbishop/prepos/testNode.js'
]
```

The first value is a reference to the Node runtime binary. The second is the file that was passed to node.

If we passed in a parameter we would get that too:

```
node process-demo.js --fakeFlag
```

Gives us:

```bash
[
  "/Users/thomasbishop/.nvm/versions/node/v16.10.0/bin/node",
  "/Users/thomasbishop/prepos/testNode.js",
  "--fake-flag",
]
```

When writing command line Node applications we could easily write functions that parse standard input. For example:

```js
function parseStandardInput(flag) {
  let indexAfterFlag = process.argv.indexOf(flag);
  console.log(process.argv[indexAfterFlag]);
}
```

Say we ran a program that took in a username:

```bash
node userName.js --user Thomas
```

Then `parseStandardInput("--user")` would give us `"thomas"`

## Standard input and output `process.stdout`

```js
// alpha.js
process.stdout.write("Hello from file \n");
```

```bash
$ node alpha.js
$ Hello from file
```
