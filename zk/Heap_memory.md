---
id: 18bl
title: Heap_memory
tags: [memory]
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

## Related notes
