---
categories:
  - Databases
tags: [mongo_db, node_js, mongoose]
---

# Modelling relationships between data

So far we have taken the values of a document to be simple: the `author` value is just a string but what if `author` was itself another collection for instance a collection with the proprties `age` and `publications` and the author name, say `Tosh Gnomay` was a document in this collection? This means we would have an interaction between two collections. In this entry we will look at how to work with interrelated collections. This is equivalent to establishing [joins](/Databases/SQL/10_Joins.md) in a relational database.

There are two main approaches to modelling relationships between data: **normalisation** and **denormalisation**.

## Modelling relationships with normalisation: using references

In the case of normalisation we use a UUID from one document to connect it to another document.

Let's say that we have a course document as follows which is an instance of the `courses` collection:

```js
{
    _id: "ceds89e"
    name: "Java course",
    author: "Tosh Gnomay"
}
```

And we have a document which is an instance of another type of collection called `authors`. One instance of it could be:

```js
{
    _id: "de89w9",
    name: "Tosh Gnomay",
    courses: ["Java course", "C# course"]
}
```

Using normalisation, we would establish the relationship by using the value of the `_id` propety in the `courses` document as the value of the `name` property in the `authors` document. We would rewrite the `courses` document like so:

```js
{
    _id: "ceds89e"
    name: "Java course",
    author: "de89w9"
}
```

## Modelling relationships with denormalisation: embedding

With denormalisation we achieve the same outcome but instead of using a reference we embed one value in another:

```js
{
    _id: "ceds89e"
    name: "Java course",
    author: {
        name: "Tosh Gnomay",
        courses: ["Java course", "C# course"]
    }
}
```

## Tradeoffs: which approach to use?

There are drawbacks and benefits with each approach.

- One benefit of normalisation is consistency. Because we are using the UUID and referencing it in another document, if we make a change to the values in the source document, it will automatically apply to all documents that reference it. We make a change in one place and it is reflected everywhere.

- Conversely, a drawback of denormalisation is that it invites inconsistency between documents. Embedded values can easily go out of sync with their usage elsewhere as you don't have a direct reference correspondence.

- On the other hand a drawback of normalisation is performance when querying. Any time you have a document that references another document than this document also has to be retrieved. Therefore for every query you are returning two documents. As denormalised references embed the second document, only one document is being returned on each query.
