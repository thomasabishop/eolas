---
tags:
  - node-js
---

# Handling streams with fs

When reading from a file, the
[`fs.readFile()`](fs.md) method waits
until the entire file has been read before executing the callback. It's obvious
why this might not be ideal in certain cases. If the file is very large you are
utilising a lot of [memory](Memory.md) for a
single process. Additionally, the data you need might appear early in the file,
in which case, once you find the data you want, there is no need to read to the
end of the file.

> An example of this in practice is watching a Netflix film: we don't have to
> wait for the whole film to download, we can start watching it immediately
> because it is passed to us in chunks.

## Reading streams

This is why the ability to read files and data as streams exists in Node.js.
Streams promote memory and time efficiency. As you are not necessarily reading
the whole file, you can extract the data you need quickly and you are not
putting the whole file in memory.

When read as a stream, the file is broken up into smaller chunks. Readable
streams raise data events and pass the chunks to our callbacks. Hence we don't
have to wait for the whole file before registering data chunks.

## Implementation

Instead of, e.g :

```js
fs.readFile("./lorem.md", "UTF-8", function (err, fileContents) {
  console.log(fileContents);
});
```

We would:

```js
let stream = fs.createReadStream("./lorem.md", "UTF-8");

let data;

stream.once("data", (chunk) => {
  console.log("read stream started");
});

stream.on("data", (chunk) => {
  data += chunk;
  console.log(data);
});

stream.on("end", () => console.log("stream ends"));
```

We use `once` to do something at the moment the stream starts to be read.

We use `on` to target the `"data"` and `"end"` events. We use this to log the
chunks via the `data` variable.

## Writing streams

When we write as a stream, we break data up and pass this to a reader as a
stream. It is what creates a stream in the first place.

For example we could create a stream that handles `stdin` and writes this to a
file in chunks:

```js
var stream = fs.createWriteStream("lorem.txt")

process.stdin.once("data", (data) => {
    stream.write(data, function() => {
        // data is now written.
    })
})

process.on("exit", function () {
    stream.close()
})
```

Note that we always have to close the stream on exit
