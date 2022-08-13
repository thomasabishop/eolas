---
tags:
- Databases
- mongo_db
- node-js
- mongoose
---

# Update a MongoDB document

There are two methods for updating a document
* query first 
* update first

## Query first document update
With this approach we first execute a [query](/Databases/MongoDB/Querying_a_collection.md) to retrieve the document we want to edit and then make the change. We use the `findById` method to identify the document by its UUID and then `set` to update specified properties on the document.  

```js
async function updateCourseFromQuery(id) {
    const course = await Course.findById(id);
    if (!course) return;
    course.set({
        isPublished: true,
        author: 'A new author'
    })

    // Instead of an object, we could also set the updated properties individually
    course.isPublished = true;
    course.author = 'Biggs Volunksire'
    
    const result = course.save()
    console.log(result);
}

```
