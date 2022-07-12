---
tags:
  - Programming_Languages
  - backend
  - node-js
  - node-modules
---

File System is an essential built-in module of Node that contains utility methods for working with files and directories.

Every method associated with `fs` has a *blocking* and *asynchronous* implementation. The former obviously blocks the [event queue](Event%20queue.md), the latter does not. 

The asynchronous methods are useful to have in some contexts but in general and with real-world applications, you should be using the async implementation.

## Methods

### Read directory

Return a string array of all files in the current directory. 

````js

fs.readdir('./', function(err, files) {
	if (err) {
		console.error(err)
	} else {
		console.log(files)	
	}
	
})
````
