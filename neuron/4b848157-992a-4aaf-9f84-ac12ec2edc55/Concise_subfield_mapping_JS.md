---
id: dv3u
tags: []
created: Friday, June 28, 2024
---

# Concise mapping of object subfileds in JS

## Scenario

You have an array of objects and you want to return the objects with only a
subset of the fields.

## Implementation

Standard approach with a map:

```js
const arrayOfObjs = [
  { id: 12, name: "Thomas" },
  { id: 3, name: "Gerald" },
];

// We just want the `name` property

const subset = arrayOfObjs.map((obj) => {
  name: obj.name;
});
```

More concise approach with destructuring:

```js
const subset = arrayOfObjs.map(({ name }) => ({ name }));
```

## Related notes
