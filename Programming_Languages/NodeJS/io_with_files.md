---
tags:
  - Programming_Languages
  - backend
  - node-js
---

# I/O with files
## Read file from directory (JSON)

````js
const fs = require("fs");

// Get raw JSON
let inputJson = fs.readFileSync("source.json");

// Convert to JS
let data = JSON.parse(inputJson);
````

## Write file to directory (JSON)

````js
let newFile = 'new.json';

// Write JS object to JSON file as JSON 
fs.writeFileSync(writePath, JSON.stringify(alienblood));

````

## Delete file from directory

````js
let filePath = 'file-to-delete.json';
fs.unlinkSync(filePath);
````

## Applications

### Overwrite file

````js
if (fs.existsSync(writePath)) {
    fs.unlinkSync(writePath);
    fs.writeFileSync(writePath, JSON.stringify(someJS));
  } else {
    fs.writeFileSync(writePath, JSON.stringif(someJS));
  }
````
