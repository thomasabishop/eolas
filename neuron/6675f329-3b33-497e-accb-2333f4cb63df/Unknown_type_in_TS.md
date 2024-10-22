---
tags:
  - typescript
---

# Unknown

You might think that a good use case for `any` is a scenario where you don't
know in advance what the data type is going to be.

In order to mark that this is the case, you type the value as `any`. In fact,
TypeScript provides a type for this specific scenario: `unknown`.

Like `any`, `unknown` is equivalent to every type in TS (it is also a supertype)
but it is deliberately inhibiting, in contrast to `any`. When you use `unknown`
you have to use type narrowing to avoid it being returned. So if your code
starts with `unknown`, you should filter out scenarios where it evaluates to
each of the possible types otherwise if `unknown` is returned it will cause an
error.
