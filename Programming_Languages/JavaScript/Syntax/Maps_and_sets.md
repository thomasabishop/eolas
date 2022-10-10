---
title: Maps and sets
categories:
  - Programming Languages
tags: [javascript]
---

# Maps and Sets

> Both `Map` and `Set` are new data structures introduced with ES6. They combine the properties of the pre-existing data structures: arrays and objects and offer advantages in certain non-typical use cases.

## Maps

### Concepts

A map (not to be confused with the array map method) introduces something like the associative array model to JavaScript. Prior to ES6 the closest thing JS had to this was an object.

Maps are like objects in that their structure consists in key/map pairs but like arrays in that the order in which the entries are placed is retained and can be referred to throughout the lifecycle of the Map. Also, the length of the Map is a known and easily returnable quantity, with objects we have to do some wrangling with `Object.keys` and `Object.entries` to retrieve meta data about the object itself. Moreover, with an object the order in which the keys are stored is not recorded.

At the same time Maps are different from arrays because the index of an array element is not unique, it will always be a number of the form `[0], [1], [2]...` .

Finally, the key can be any data type not just a string. This is an important characteristic of maps because although you can use numbers or booleans as the keys in an object, they are not actually numbers, they are converted to strings at execution. With Maps, whatever data type you assign as a key, retains its type.

Maps

- Have key/value pair structure
- Have length property
- Order of entries and insertions is maintained
- Can use any data type as a key
- Disallow duplicate keys

### Creating a Map and adding entries

```jsx
const map = new Map();

// We then pass in key/value pairs using `set`:
map.set("firstName", "Luke");
map.set("lastName", "Skywalker");
map.set("occupation", "Jedi Knight");
```

There is an alternative method for defining a map:

```jsx
const map = new Map([
  ["firstName", "Luke"],
  ["lastName", "Skywalker"],
  ["occupation", "Jedi Knight"],
]);
```

Internally, this data will be represented as follows:

```
Map(3)
0: {"firstName" => "Luke"}
1: {"lastName" => "Skywalker"}
2: {"occupation" => "Jedi Knight"}
```

### Working with map elements

```jsx
// check for the existence of an item in a map by searching for existence of key
map.has("firstName"); // return boolean

// return all keys in a Map as iterator
map.keys(); // MapIterator {'firstName', 'lastName', 'occupation'}

// return all values as iterator
map.values();

// return array of key/value pairs
map.entries(); // {"firstName" => "Luke", "lastName" => "Skywalker", "occupation" => "Jedi Knight"}
// retrieve an item from a Map
map.get("lastName"); // Skywalker

// delete an item from a map by key, returns boolean as confirmation
map.delete("occupation"); // true

//return the length of a map (just like array.length)
map.size; // 3
// clear all values
map.clear();
```

### Looping

```jsx
// Map has its own .forEach method, like with arrays. Hewre they are side by side

// Map
Map.prototype.forEach((value, key, map) = () => {})

// Array
Array.prototype.forEach((item, index, array) = () => {})

// You can also use a for of loop
// Destructure the key and value out of the Map item
for (const [key, value] of map) {
  // Log the keys and values of the Map with for...of
  console.log(`${key}: ${value}`)
}
```

### Interfacing between Maps and other reference types

Given that we can create a map with both object and array-style syntax, its easy to convert maps to and from the more established data structures.

It's easy to convert an object to a map:

```jsx
const luke = {
  firstName: "Luke",
  lastName: "Skywalker",
  occupation: "Jedi Knight",
};

const map = new Map(Object.entries(luke));
```

And a map to an object:

```jsx
const obj = Object.fromEntries(map);
```

A map to an array:

```jsx
const arr = Array.from(map);
```

We saw earlier that a Map is a multidimensional array, so any multidimensional array can be used in the Map constructor invocation to turn it into a Map.

## Sets

A set is special kind of array, an atypical supplement to arrays. It is basically an array of unique values. If you try to add a duplicate entry to a set it will be ignored.

```jsx
const set = new Set();
set.add("Beethoven");
set.add("Bach");

// Or:
const set = new Set(["Beethoven", "Bach"]);

// Convert array to set (note, this will remove duplicates on initialisation)
const arr = [...set];
```

We can use `keys()`, `values()`, and `entries()` with sets but obviously, `keys` and `values` will be identical.
