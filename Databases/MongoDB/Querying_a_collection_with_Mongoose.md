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

## Return values with `find`

```js
async function getCourses(){
  const courses = await Course.find()
  console.log(courses)
}
```

## Filter values returned

This will return all the published courses where Tosh Gnomay is the author:

```js
async function getCourses(){
  const courses = await Course.find({author: 'Tosh Gnomay', isPublished: true})
  console.log(courses)
}
```

This time we will filter by the same author but we will add additional parameters to distinguish:

* only the first ten entries (using `.limit(10)`)
* sort ascending by name (using `.sort({name: 1}))` , to descend we would use `-1`) 
* only return the properties `name` and `tags` for the item in the collection (using `.select({name: 1, tags: 1})`)

```js 
async function getCourses(){
  const courses = await Course
  .find({author: 'Tosh Gnomay', isPublished: true})
  .limit(10)
  .sort({name: 1})
  .select({name: 1, tags: 1})
  console.log(courses)
}

```

This returns: 

```js
[
  {
    _id: new ObjectId("62f4f07a875cff48827b8731"),
    name: 'Java Course',
    tags: [ 'java', 'backend' ]
  },
  {
    _id: new ObjectId("62f4e2527ac4aa2c30d41d24"),
    name: 'Javascript Course',
    tags: [ 'js', 'frontend' ]
  }
]
```

> Note that the UUID is always returned, whether we specify it or not.

## Comparison operators

The following comparison operators are available in MongoDB:

| Operator | Function                  |
|----------|---------------------------|
| `eq`     | Equal to                  |
| `ne`     | Not equal to              |
| `gt`     | Greater than              |
| `gte`    | Greater than or less than |
| `lt`     | Less than                 |
| `lte`    | Less than or equal to     |
| `in`     | In                        |
| `nin`    | Not in                    |

We can employ these comparators within a `.find` filter. For example let's imagine that our `courses` instances have a property of `price`. To filter prices $>= 10 \And \And <= 20$:

```js
Course.find(({price: {$gte: 10, $lte: 20} }))
```