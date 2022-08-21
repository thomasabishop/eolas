---
categories: 
  - DSA
tags: []
---
# Sliding window 

Whereas the [multiple pointer](Multiple_pointers.md) pattern works by keeping two array indices running at once and comparing their values on each iteration, the sliding window
has a running value (the 'window') that is updated at each iteration and which compares itself against its most recent previous value. 

This is what makes it 'sliding': the value isn't constant, it changes (or doesn't) based on what it was previously. 

## Example: maximum sum of sub-array

We create a function that takes an array and a sub-array length _n_. The objective is to find the maximum value that can be created by summing _n_ elements of the array. It moves through the array, summing by _n_ keeping track of the highest sum value so far and the current sum value. At the end it should return the highest possible sum value. 

Here we do this for a sub-array of length 2: 

```ts
function maxSubarraySum(arr, subArrLength) {
  let maxSum = 0; // Largest sum value so far
  let tempSum = 0; // Current sum value

  //  Establish the first 'maxSum'
  // At the beginning this will just be the sum of the first two array elements
  for (let i = 0; i < subArrLength; i++) {
    maxSum += arr[i];
  }

  // Map temporary sum to maxSum
  // Accordingly, as we have only mapped the first sub-array, the max sum will be the same
  // as the current sum
  tempSum = maxSum;

  // Move through the array one element at a time (`i++`) via a window starting from the element that is equal to `subArrLength`
  // The first sum calculation is already taken care of in the earlier loop and stored in `maxSum`, so we don't have to worry about missing the elements in indices less than subArrLength
  for (let i = subArrLength; i < arr.length; i++) {
    // Temp sum becomes a moveable window value equal to the subtraction of the previous element and the addition of next element in line
    tempSum = tempSum - arr[i - subArrLength] + arr[i];
    // Max sum is redefined as the largest subArrLengthber between the previous highest and the current value of tempSum
    maxSum = Math.max(maxSum, tempSum);
  }
  return maxSum;
}

console.log(maxSubarraySum([100, 200, 300, 400], 2)); // 700
```