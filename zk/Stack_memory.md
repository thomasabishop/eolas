---
id: 1fig
title: Stack_memory
tags: [memory]
created: Tuesday, April 16, 2024
---

# Stack memory

Along with heap memory, programs make use of _stack memory_ during the runtime
of programs.

## Stack memory

Similarly to the [[stack data structure]], it works on the basis of LIFO: the
last item put on the stack is the first item to be withdrawn.

Note, this doesn't mean that the data at the memory addresses that comprise the
stack can _only_ be accessed in a LIFO manner. Any item currently on the stack
can be accessed (be read or modified) at any time. LIFO applies when it is is
time to clear memory from the stack: the most recent addition is cleared first.

### Stack pointer

A **stack pointer** is used to manage the items in the stack. This value is
stored in a [[processor register]] and its value is the memory address of the
item currently on the top of the stack.

## Related notes
