---
id: 18bl
title: Heap_memory
tags: [memory, C]
created: Saturday, April 20, 2024
---

# Heap memory

Along with [[Stack_memory|Stack memory]], programs make use of _heap memory_
during runtime.

Heap memory does not use a standardised data structure and can be accessed from
any point within the program.

Whereas stack memory with it's LIFO structure has memory management built-in
when programs allocate memory from the heap they must manually deallocate it
when it is no longer required. This process of "freeing memory" is known as
_garbage collection_. In a language like C, this is the explicit concern of the
programmer and is not abstracted away. Failure to properly manage garbage
collection is what causes [[Memory_leaks]].

Heap memory is used in combination with the stack since a given heap memory
allocation address is stored as a stack variable during runtime. It points to
the heap memory address whilst not being that memory itself.

Here is an example of managing heap memory allocation in C:

```c
void * data;
data = malloc(512)
```

The first line assigns a special _pointer_ variable (indicated by `void *`
rather than `int` or `str`) . This is a variable only holds a memory address.
The `malloc` method requests 512 bytes that it wants to assign to the `data`
variable. It will return the address of the first byte in the newly allocated
memory. `data` will then refer to the address on the stack that holds the
address allocation on the heap.

## Related notes
