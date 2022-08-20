---
categories:
  - Databases
tags: [mongo-db, node-js, mongoose]
---

# MongoDB: deleting a document from a collection

```js
async function deleteCourse(id) {
  const result = await Course.deleteOne({id: id});
  console.log(result);
}
```

Use `findByIdAndRemove([id])` if you want to return the value that is deleted.

If we were to pass a query object that matches multiple documents in the database to `deleteOne` it would only delete the first document returned. To delete all use `deleteMany`.
