---
categories:
  - Databases
tags: [mongo-db, node-js, mongoose]
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

- `find`
- `findById`
- `findByIdAndRemove`
- `findByIdAndUpdate`
- `findOne`
- `findOneAndUpdate`
- `findOneAndRemove`
- ...

The various `find` methods return a value that is promisified.

## Return values with `find`

```js
async function getCourses() {
  const courses = await Course.find();
  console.log(courses);
}
```

## Filter values returned

This will return all the published courses where Tosh Gnomay is the author:

```js
async function getCourses() {
  const courses = await Course.find({author: 'Tosh Gnomay', isPublished: true});
  console.log(courses);
}
```

This time we will filter by the same author but we will add additional parameters to distinguish:

- only the first ten entries (using `.limit(10)`)
- sort ascending by name (using `.sort({name: 1}))` , to descend we would use `-1`)
- only return the properties `name` and `tags` for the item in the collection (using `.select({name: 1, tags: 1})`)

```js
async function getCourses() {
  const courses = await Course.find({author: 'Tosh Gnomay', isPublished: true})
    .limit(10)
    .sort({name: 1})
    .select({name: 1, tags: 1});
  console.log(courses);
}
```

This returns:

```js
[
  {
    _id: new ObjectId('62f4f07a875cff48827b8731'),
    name: 'Java Course',
    tags: ['java', 'backend'],
  },
  {
    _id: new ObjectId('62f4e2527ac4aa2c30d41d24'),
    name: 'Javascript Course',
    tags: ['js', 'frontend'],
  },
];
```

> Note that the UUID is always returned, whether we specify it or not.

## Querying with operators

So far when filtering we have been doing so with reference to properties that exist on the document's model (`author`, `isPublished` etc) and we have applied tranformations on the data returned (sorting, limiting the number or matches etc.). However we can also apply **operators** within our queries. Operators allow us to perform computations on the data, for example: for a given numerical property on an object, return the objects for which this value is within a certain range.

When we apply operators we use the `$` symbol before the operator and pass the operator function as an object.

The schema:

```
Model.find( { property: { $operator: conditions } } )
```

### Comparison operators

The following comparison operators are available in MongoDB:

| Operator | Function                  |
| -------- | ------------------------- |
| `eq`     | Equal to                  |
| `ne`     | Not equal to              |
| `gt`     | Greater than              |
| `gte`    | Greater than or less than |
| `lt`     | Less than                 |
| `lte`    | Less than or equal to     |
| `in`     | In                        |
| `nin`    | Not in                    |

We can employ these comparators within a `.find` filter. For example let's imagine that our `courses` instances have a property of `price`.

To filter course prices that are greater than or equal to 10 and less than or equal to 29:

```js
Course.find({price: {$gte: 10, $lte: 20}});
```

To filter course prices that are either 10, 15 or 20:

```js
Course.find({price: {$in: [10, 15, 20]}});
```

### Logical operators

When we apply logical operators, we do not apply the query within the main `find` method. We use a dedicated method that corresponds to the logical predicate.

For example to query by logical [OR](/Logic/Truth-functional_connectives.md#disjunction):

```js
async function getCourses() {
  const courses = await Course.find().or([{author: 'Tosh Gnomay'}, {isPublished: true}]);
  console.log(courses);
}
```

We write each disjunct as an object representing the conditions we are filtering for within an array that is passed to the `.or()` method.

The same syntax applies for conjunction.

### Regular expressions

When filtering by strings we can use Regex for greater power.

Previously we filtered by the author name:

```js
.find({author: "Tosh Gnomay"})
```

To demonstrate regex we could filter by names beginning with `T`:

```js
.find({author: /^T*/})
```

```js
async function getCourses() {
  const courses = await Course.find()
    .or([{author: 'Tosh Gnomay'}, {isPublished: true}])
    .count();
  console.log(courses);
}
```

This will return a number.

### Pagination

We previously used the `limit()` method to control how many matches we return from a query. We can extend this functionality by creating pagination. This allows us to meter the return values into set chunks. This is used frequently when interacting with a database through a mediating RESTful API. For example to return values from endpoints such as:

```
/api/courses?pageNumber=2&pageSize=10
```

To do this you pass two values as query parameters

```js
const pageNumber = 2;
const pageSize = 10;

async function getCourses() {
  const courses = await Course.find()
    .skip(pageNumber - 1 * pageSize)
    .limit(pageSize);
  console.log(courses);
}
```
