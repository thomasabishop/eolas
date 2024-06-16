---
tags:
  - typescript
---

# Type narrowing and guarding

Type narrowing is the process of working out from a supertype like
[any](Any.md) or [unknown](Unknown_type_in_TS.md) whic type the value should be in the
x course of your code. This is necessary since a process will not necessarily
always return or involve homogenous types.

Related to this is type guarding: ensuring that a value is of the suitable type
as a factor of control flow. For instance using typeof to ensure that an input
is numerical before proceeding with a function's logic.
