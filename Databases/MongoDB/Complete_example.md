---
categories:
  - Databases
tags: [Databases, mongo-db, node-js, mongoose, ABBA]
---

# MongoDB connection, set-up and data query: complete example

```js
const mongoose = require("mongoose");

mongoose..connect("mongodb://127.0.0.1/[databse_name]");

const courseSchema = new mongoose.Schema({
    name: String,
    author: String,
    tags: [String],
    data: Date,
    isPublished: Boolean,
    price: Number
})

const Course = mongoose.model("Course", courseSchema);

async function getCourses(){
    return await Course
        .find({isPublished: true, tags: "backend"})
        .sort({name: 1})
        .select({name: 1, author: 1});
}
```
