---
tags:
  - Programming_Languages
  - typescript
  - data_types
---

# Primitive types

The most basic type level is the one already present in JavaScript itself: the primitive data types: `boolean`, `string` and `number` . These are the types that would be returned from a `typeof` expression in ordinary JavaScript

## Type inference

You can explicitly declare these data types yourself when you create a variable with `var`, `const`, or `let` if you like, but it is generally unnecessary since Typescript is intelligent enough to perform **type inference** and will know from what you write which type you mean.

```ts
const age: number = 32;
const name: string = 'Thomas';
const one: boolean = true;
const zero: boolean = false;
```

## Arrays

With arrays that you directly define the type will also be inferred but it can be helpful to explicitly declare them. If you declare an empty array, it is necessary to assign empty brackets.

```ts
const store: number[] = [1, 2, 3]; // Populated array
const store: string[] = []; // Empty array
```

## Object

`Object` is a valid type declaration in TS but it is not particularly helpful since it becomes similar to using [any](./Any.md) given that most primitive types in JavaScripts prototypically inherit from an Object.

Generally, when you use objects in TypeScript you type them as [custom types](./Custom_types.md).
