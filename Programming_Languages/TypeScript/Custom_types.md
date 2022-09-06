---
categories:
  - Programming Languages
tags:
  - typescript
---

# Custom types

Objects and [classes](./Classes.md) are where TypeScript becomes most useful and powerful. In TypeScript, objects and classes are by definition custom types.

When typing objects, you do not write the types alongside the actual data as you would with primitive types, classes and functions. Instead you write a custom type which is a type-annotated object. This is then applied to the object or class, where you create instances that **match the shape** of the custom declaration.

So say we have this object:

```js
const age = {
  name: 'Thomas',
  yearOfBirth: 1988,
  currentYear: 2021,
  ageNow: function () {
    return this.currentYear - this.yearOfBirth;
  },
};
```

We could write this as type with the following:

```ts
let Age: {
  name: string;
  yearOfBirth: number;
  currentYear: number;
  ageNow: () => number;
};
```

(We use `:` because we are declaring a type not intialising a value of the type.)

We could now re-write the first `age` object as an object of type `Age` :

```tsx
let thomas: typeof Age;

thomas = {
  name: 'Thomas',
  yearOfBirth: 1988,
  currentYear: 2021,
  ageNow: function () {
    return this.currentYear - this.yearOfBirth;
  },
};
```

In practice, defining the type and then asserting that a new variable is of this type and then initialising it is rather long-winded. It is better practice to simplify the process by creating a **type alias**.

```tsx
type Age = {
  name: string;
  yearOfBirth: number;
  currentYear: number;
  ageNow(): number; // we type the method on the basis of the value it returns
};
```

We could then create objects based on this:

```tsx
const thomas: Age = {
  name: 'Thomas',
  yearOfBirth: 1988,
  currentYear: 2021,
  ageNow: function () {
    return this.currentYear - this.yearOfBirth;
  },
};
```

Note that we pass in `:Age` as our type declaration, using the custom type in the same way as we would use `:string` or `number[]` . We can now use this custom type as a type annotation anywhere we use type annotations; it can be used exactly the same way as a primitive type in our code.

`Age` is an alias for the type that `thomas` conforms to.

The benefit is that TS will correct you if:

- attempt to assign a type to a value that does not match the custom type declaration (for instance: assigning a string value to a property you have typed as number)
- attempt to add a property that is not specified in the custom type declaration

Although you can subsequently _extend_ the custom type (detailed below).

## Duck typing

> Types are defined by the collection of their properties not their name.

Typescript's implementation of types is as a **structural type system**, which contrasts with a nominal type system. This is often referred to colloquially as 'duck typing': _if it looks like a duck, walks like a duck, and sounds like a duck, it probably is a duck_.

With custom (object types) this means that the following expression of an object of type `Age` doesn't generate an error, TS is satisfied that the shapes of each match.

```tsx
const martha = {
  name: 'Martha',
  yearOfBirth: 1997,
  currentYear: 2021,
  gender: 'female',
};

const addition: Age = martha;
```

But if we tried to add this extra property whilst defining `martha` as an instance of the custom type `Age` , we would get an error:

```tsx
const martha: Age = {
  name: 'Martha',
  yearOfBirth: 1997,
  currentYear: 2021,
  gender: 'female',
};
```

```
Type '{ name: string; yearOfBirth: number; currentYear: number; ageNow: () => number; gender: string; }' is not assignable to type 'Age'. **Object literal may only specify known properties, and 'gender' does not exist in type 'Age'.**
```

It means that even though in the following, the variable `point` is never declared to be of the type `Point` , it matches the shape of the custom type. As the structural integrity is maintained, it can be passed to the function without error.

```tsx
interface Point {
  x: number;
  y: number;
}

function logPoint(p: Point) {
  console.log(`${p.x}, ${p.y}`);
}

// logs "12, 26"
const point = {x: 12, y: 26};
logPoint(point);
```

Shape matching only requires a subset of the object's fields to match:

```tsx
const point3 = {x: 12, y: 26, z: 89};
logPoint(point3); // logs "12, 26"

const rect = {x: 33, y: 3, width: 30, height: 80};
logPoint(rect);
```

## Interfaces

For most purposes the keywords `type` and `interface` are interchangeable in TypeScript.

(The main difference that I have encountered is that Angular specifies that interfaces should be used over types, but this is because it is class-based and object oriented).

For me, the main decider is that Angular favours `interface` over `type`. The TS handbook recommends using the `type` keyword over `interface`.

An interface is concept that crosses over from strict OOP and it doesn't quite apply to interfaces in TS because an interface is a declaration of a class's functions alone, not its data (i.e properties).
