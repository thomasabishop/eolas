---
categories:
  - Programming Languages
tags: [javascript]
---

# Expressing combined map and filter operations to a single reduce

## `map` + `filter`

The following combines a `map` and a `filter` to square a list of numbers and
then filter the ones that are greater than or equal to 10:

```js
const arr = [1, 2, 3, 4];

const filteredSquaredNumbers = arr.map((x) => x * x).filter((y) => y >= 10);
```

Using `reduce` we can combine these operations more concisely:

```js
const filteredSquaredNumbers = arr.reduce((acc, x) => {
  const squared = x * x;
  if (squared >= 10) {
    acc.push(squared);
  }
  return acc;
}, []);
```

## `filter` + `map`

Here we use a filter and then a map to filter the even numbers and then double
them:

```js
const arr = [1, 2, 3, 4];

const evenDoubled = arr.filter((x) => x % 2 === 0).map((y) => y * 2);
```

Using `reduce` :

```js
const evenDoubled = arr.reduce((acc, x) => {
  if (x % 2 === 0) {
    acc.push(x * 2);
  }
  return acc;
}, []);
```

> The empty array [] is the initial value of the accumulator. As the callback
> function processes each element of the array, it can add or modify the
> accumulator based on the desired logic. By providing an empty array as the
> initial value for the accumulator, we ensure that the results will be
> collected in a new array without modifying the original array.
