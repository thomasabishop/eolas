---
categories:
  - Databases
tags: [mongo_db, node_js, mongoose]
---

# Update a MongoDB document

There are two methods for updating a document

- query first
- update first

## Query first document update

With this approach we first execute a [query](/Databases/MongoDB/Querying_a_collection.md) to retrieve the document we want to edit and then make the change. We use the `findById` method to identify the document by its UUID and then `set` to update specified properties on the document. The `set` method is one of many operators that can be used to update values. For example there is also built-in operators for increment, renaming, multiplying values.

Query first is best used when you want to secure the update with some prior logic or to validate. For example you may not want to update a course if it is listed as published. You could use a query to determine the publish status and then only update the entry if it returns `isPublished: false`.

```js
async function updateCourseFromQuery(id) {
  const course = await Course.findById(id);
  if (!course) return;
  course.set({
    isPublished: true,
    author: 'A new author',
  });

  // Instead of an object, we could also set the updated properties individually
  course.isPublished = true;
  course.author = 'Biggs Volunksire';

  const result = course.save();
  console.log(result);
}
```

## Update first document update

With this approach we don't bother with a prior query. We are confident that the update is legitimate and do not need to first determine that certain conditions are met.

To do this we directly use the `update` method, not `find`:

```js
async function updateCourseFromQuery(id) {
  const result = await Course.update({_id: id});
  $set: {
    // Invoke the set operator
    author: 'Terry Nutile';
    isPublished: true;
  }
  console.log(result);
}
```

This function will just return some metadata about the update. It won't by default return the updated value. To do this use the `findByIdAndUpdate()` method instead of `update`:

```js
async function updateCourseFromQuery(id) {
    const course = await Course.findByIdAndUpdate(id, {
    $set: { // Invoke the set operator
        author: 'Terry Nutile'
        isPublished: true
    }, {new: true}});
    console.log(result)
}
```

If we don't add `{new: true}`, it will return the document before the update.

### Updating multiple documents at once

// TODO : Add notes on this
