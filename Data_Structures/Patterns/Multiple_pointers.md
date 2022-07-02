---
tags:
  - Data_Structures
  - patterns
---

# Multiple pointers

The multiple pointers pattern can be useful for moving through an array and comparing elements against each other in a time-efficient manner and without costly multiple loops. 

## Example: moving pairs 

In this example we shuffle through an array creating a pair from each element encountered. Thus for an array such as `[4, 3, 2, 1, 3, 6, 7]` we would return `[ [ 4, 3 ], [ 3, 2 ], [ 2, 1 ], [ 1, 3 ], [ 3, 6 ], [ 6, 7 ] ]`.

```js
function movingPairs(arr) {
  const store = [];
  let left = 0;
  let right = 1;
  for (left; left < arr.length - right; left++) {
    store.push([arr[left], arr[right + left]]);
  }
  return store;
}
```
## Example: identify unique values

An example application of the above pattern would be identifying the number of unique values in an array that contains duplicates. One way to do this in JavaScript would be to use a Set however this is a more generic approach that only requires a single loop:

```js
function uniqueValues(arr) {
  if (!arr.length) {
    return 0
  } else {
    let count = 1
    let left = 0
    let right = 1
    for (right; right < arr.length; right++) {
      if (arr[left] !== arr[right]) {
        count++
      }
      left++
    }

    return count
  }
}
```
This works by having two pointers at either end of the array; one moving from the right and one moving from the left. Whilst the right pointer is less than the array length, the left pointer is incremented as the right moves closer to it. At each incrementation, the values of pointers (used as indexes) are compared for uniqueness, and a count is kept.

## Example: identify duplicates

This is very similar to the above but this time we are looking for duplicates rather than unique values.

```js
function areThereDuplicatesPointer(...input) {
  let start = 0
  let next = 1
  while (next < input.length) {
    let same = input[start] === input[next]
    if (same) {
      return true
    }
    start++
    next++
  }

  return false
}
console.log(areThereDuplicatesPointer(1, 2, 3)) // false
console.log(areThereDuplicatesPointer(1, 2, 2)) // true

```