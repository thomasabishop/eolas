---
tags:
  - node-js
---

# The `process` module in Node.js

`process` is a core module and a global object accessible from anywhere in a
Node.js application. It contains functionality that allows us to interact with
information about the current process instance of Node.

For example, we can use it to get environment information, read environment
variables, parse arguments that are passed to the run command, communicate with
the terminal and exit the current process.

## Managing runtime environments

See
[Managing Environments](Managing_environments_in_NodeJS.md).

## Accessing arguments: `process.argv`

We can use `process.argv` to return an array containing the command-line
arguments passed when a Node process is launched. This could be a whole-app
entrypoint (i.e. `index.js`) or a single file we are running.

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

The first item is the last executed process. The second is the array of
arguments.

In the array, the first value is a reference to the Node runtime binary. The
second is the file that was passed to Node.

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

When writing Node CLI applications we can write functions that parse standard
input. For example:

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

## Standard input and output

Below is the most basic use case: writing to the output.

```js
// alpha.js
process.stdout.write("Hello from file \n");
```

```
node alpha.js
Hello from file
```

Typically we want to write and read data that the user provides. To do this we
need to wait on that event. So we use Node's asynchonous
[event listeners](events.md). We wait
on the `data` event:

```js
process.stdin.on("data", (data) => {
  process.stdout.write(data.toString().trim());
});

process.stdout.write("\n What is your name? \n");
process.stdout.write(` \n > `);
```

This waits for whatever input is given and then echoes it.

Currently there is no way to end this process; it will just keep echoing the
input.

So we add an exit clause:

```js
process.stdin.on("data", (data) => {
  process.stdout.write(data.toString().trim());
  process.exit();
});
```

We can also execute functionality on the exit event:

```js
process.on("exit", () => {
  // Do something
});
```

> Timings can also obviously be managed via the `setTimeout` and `setInterval`
> methods.

### Additional useful methods

```js
process.stdout.clearLine();
process.stdout.cursorTo([int]);
```

### `readline`

The core `readline` module simplifies the handling of standard input and output
by providing a wrapper. It reads the input stream line by line. Basic usage:

```js
var readline = require("readline");

var rl = readline.createInterface(process.stdin, process.stdout);

rl.question("What is your age? ", (age) => {
  console.log("Your age is: " + age);
});
```

Usage scenarios at: https://www.geeksforgeeks.org/node-js-readline-module/
