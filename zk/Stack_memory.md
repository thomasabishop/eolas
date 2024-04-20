---
id: 1fig
title: Stack_memory
tags: [memory]
created: Tuesday, April 16, 2024
---

# Stack memory

## Summary

- Along with heap memory, programs make use of _stack memory_ during the runtime
  of programs.

- Specifically used to keep track of memory used during function executions
  within a given scope: control flow, local variables, returned value.

- Uses a LIFO data-structure

- Best suited for small-sized singular values rather than large or complex data
  types

## Stack memory

Similarly to the [[Stacks|stack data structure]], it works on the basis of LIFO:
the last item put on the stack is the first item to be withdrawn.

Note, this doesn't mean that the data at the memory addresses that comprise the
stack can _only_ be accessed in a LIFO manner. Any item currently on the stack
can be accessed (be read or modified) at any time. LIFO applies when it is is
time to clear memory from the stack: the most recent addition is cleared first
from the top down.

### Stack pointer

A **stack pointer** is used to manage the items in the stack. This value is
stored in a [[CPU_architecture#registers|register]] and its value is the memory
address of the item currently on the top of the stack. Note: _not_ the value
itself, the _address_ of the value.

When a new value is added to the top of the stack, the pointer's value is
adjusted to increase the size of the stack and make room for the new value. So
this will be a new memory address for the latest item. When an item is removed,
the reverse happens. The previously top address is cleared and the pointer
points to the new top item.

### Role in program execution

1. Function call management: a stack records the key information pertaining to
   the execution of a function: parameters, local variables, the location of the
   address for the returned value.

2. Local variable storage: storing the variables local to a function's scope and
   removing them once the function returns, avoiding
   [[Memory_leaks|memory leaks]]

3. Control flow: record from where a function is called and where its return
   value should be stored, meaning the right value is always returned no matter
   how nested it is.

4. Recursion: individuating each call of a function that calls itself and its
   given step to avoid infinite loops

## Related notes
