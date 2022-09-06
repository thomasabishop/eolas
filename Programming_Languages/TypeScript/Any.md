---
categories:
  - Programming Languages
tags:
  - typescript
---

# Any

`any` is a TS-specific type that we can think of it as a higher level parent to all the other types that exist in TypeScript.

It means in effect that either no type declaration has been asserted or that the TS compiler cannot infer the type that you mean. Because `any` does not have a data type it is equivalent to all the individual scalar and reference types combined. In TS this kind of type is called a **supertype**, and specific types that actually correspond to a scalar or reference type are known as **subtypes**. `any`is the supertype of all types and `string` for example is a subtype of `any`.

> Every value of `string` can be assigned to its supertype`any` but not every value of `any` can be assigned to its subtype `string`

You can declare `any` as a type if you wish however it is discouraged because it effectively undermines the whole purpose of TS. Doing so is basically the same thing as declaring a value in normal JS - there is no designation at left hand assignation of which type the data belongs to.

> `any` reflects JavaScript's overarching flexibility; you can see it as a backdoor to a world where you want neither tooling nor type safety.

`any` means you can escape errors during development. If you are using custom types/interfaces and you keep getting an annoying error saying that property X doesn't exist on type,, `any` will allow you to overcome it until you go back later and refine.
