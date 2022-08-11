---
tags:
- Databases
- mongo_db
- node-js
- mongoose
---

# Query a Mongo collection with Mongoose 

We now have the following entries in our `courses` collection:

```js
{
  name: 'Python Course',
  author: 'Terry Ogleton',
  tags: [ 'python', 'backend' ],
  isPublished: true,
  _id: new ObjectId("62f4e2527ac4aa2c30d41d23"),
  date: 2022-08-11T11:04:50.750Z,
  __v: 0
}
{
  name: 'Javascript Course',
  author: 'Tosh Gnomay',
  tags: [ 'js', 'frontend' ],
  isPublished: true,
  _id: new ObjectId("62f4e2527ac4aa2c30d41d24"),
  date: 2022-08-11T11:04:50.750Z,
  __v: 0
}

```

Now we will query the collection. This capability is provided via the Mongoose schema class we used to create the `Course` [model](/Databases/MongoDB/Create_collections_and_documents_with_Mongoose.md#models). We have the following methods available to use from the schema:

* `find`
* `findById`
* `findByIdAndRemove`
* `findByIdAndUpdate`
* `findOne`
* `findOneAndUpdate`
* `findOneAndRemove`
* ...

The various `find` methods return a value that is promisified.

## Return all values in a collection: `find`

```js
async function getCourses(){
  const courses = await Course.find()
  console.log(courses)
}
```

### Filter values returned

```js
async function getCourses(){
  const courses = await Course.find({author: 'Tosh Gnomay', isPublished: true})
  console.log(courses)
}
```
