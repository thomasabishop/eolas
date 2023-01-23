---
categories:
  - Programming Languages
tags:
  - backend
  - node-js
  - node-modules
---

# `fs` module

File System is an essential built-in module of Node that contains utility methods for working with files and directories.

Every method associated with `fs` has a _blocking_ and _asynchronous_ implementation. The former obviously blocks the [event queue](Event%20queue.md), the latter does not.

The synchronous methods are useful to have in some contexts but in general and with real-world applications, you should be using the async implementation so as to accord with the single-threaded event-driven architecture of Node.

## Common I/0 methods

### Read directory

Return a string array of all files in the current directory.

```js
fs.readdir("./", function (err, files) {
  if (err) {
    console.error(err);
  } else {
    console.log(files);
  }
});
```

### Read from file

```js
fs.readFile("./lorem.md", "UTF-8", function (err, fileContents) {
  console.log(fileContents);
});
```

### Write to file

```js
let md = `A new file`;

fs.writeFile("testFile.md", md.trim(), function () {
  console.log("File was created");
});
```

### Appending to file

```js
fs.appendFile("testFile.md", "new content");
```

### Create directory

```js
if (!fs.existsSync("directory_name")) {
  fs.mkdir("directory_name", function (err) {
    if (err) {
      console.err(err);
    }
  });
} else {
  console.warn("Directory already exists");
}
```

### Rename and remove files

```js
fs.rename("./filename.js", "./newname.js", function () {
  console.log("file renamed");
});
```

```js
// Remove file
fs.unlink("./file-to-delete", function (err) {
  if (err) {
    console.error(err);
  }
});
```

### Rename and remove directories

```js
// Best to use synchronous method here
fs.rmSync("/dir", { recursive: true, force: true });
```

## Streams

See [Handling streams with fs](/Programming_Languages/Node/Streams.md)

In the examples above of reading from a file, the `fs.readFile()` method waits until the entire file has been read before executing the callback. It's obvious why this might not be ideal in certain cases. If the file is very large you are utilising a lot of memory for a single process. Additionally, the data you need might appear early in the file, in which case, once you find the data you want, there is no need to read to the end of the file.

This is why the ability to read files and data as streams exists in Node.js. Streams increase memory and time efficiency. As you are not necessarily reading the whole file,

Streams are more memory efficient since you are not waiting for the whole file to be read before acting. This also means you can start execution quicker.
