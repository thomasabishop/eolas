---
categories:
  - DSA
tags: []
---

# Frequency counters

Here is a concise method for counting the number instances of each type of array
element.

```js
function frequencyCounter(...inputArr) {
  let counter = {};
  inputArr.forEach((item) => {
    // If item doesn't exist as a key in the counter, make 0 the val and add one
    // If item already exists as key in the counter, increment it by one
    counter[item] = (counter[item] || 0) + 1;
  });
  return counter;
}
```

An application of this would be checking for duplicates in an array:

```js
const testArr = [1, 4, 3, 3];
const arrayFreq = frequencyCounter(testArr);
let count = Object.values(arrayFreq);

if (count.some((ele) => ele > 1)) {
  return "There are duplicates";
} else return "No duplicates";
```
