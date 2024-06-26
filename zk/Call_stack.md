---
tags: [memory, javascript]
---

# The call-stack

A [stack](Stacks.md) data structure that holds the information of the functions
called within a program that allows transfer of the application control from
these functions to the main process after code inside the functions has been
executed.

## Example

```js
function greet(who) {
  console.log("Hello " + who);
}

greet("Harry");

console.log("Bye");
```

### Breakdown

1. Interpreter receives call to `greet()`
2. Goes to the definition of this function (`function greet(who)...`)
3. Executes the `console.log` within this function
4. Returns to the location that called it (`greet("Harry")`)
5. Finds that there is nothing else to do in this function so moves to next
   function: the `console.log("bye")`
6. Executes
7. Returns to line that called it. Finds nothing else to do. Exits program.

## Related notes

![Stack memory](Stack_memory.md)
