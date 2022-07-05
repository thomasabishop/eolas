---
tags:
  - Programming_Languages
  - typescript
---

# Union types

Like intersection types, union types allow us to combine the properties of existing primitive and custom types to make composites.

Intersection types work well when you have complete knowledge of what form your data will take. This approach only works if you know in advance that your data will be and that it will share properties from more than one type. But what if you don't have this knowledge? You only know that it will be one of the three possible types? This is where union types become helpful. Instead of saying that event X will be of type A we say that event X may be one of types A or B or C.

> A union type is a type formed from two or more other types, representing values that may be any one of those types. We refer to each of these types as the union’s members.

## Demonstration

```ts
type Petrol = {
  maxSpeed: number;
  tankVolume: number; // unique property
};

type Electric = {
  maxSpeed: number;
  maxCharge: number; // unique property
};

type Car = Petrol | Electric;

const tesla: Car = {
  maxSpeed: 120,
  maxCharge: 22,
};
```

- We have defined two custom types: `Petrol` and `Electric`
- We have unified them to make a new custom type of `Car`
- `tesla` is an instance of the union type

## Usage with functions

Union type syntax is not limited to the declaration phase. You can also use them as parameters to functions or function return types:

```ts
function generateCar(car: Petrol | Electric): void {
  console.log(`The car has a max speed of ${car.maxSpeed}`);
}
```

## Unifying primitive and custom types

We can also use unions with primitive types as well as custom types:

```ts
function printId(id: number | string): void {
  console.log(`Your id is ${id}`);
}
```

We can also combine primitive and custom types in the same union:

```ts
function printStringOrNumber(): string | Petrol {}
```

## Set theory: understanding errors

In JavaScript we have the primitive types of string , number , boolean etc. In TS, these types are distinct and exclusive: if you declare that x : string you cannot redefine it as boolean or expect Boolean properties and methods to belong to a string type. For instance a string type is incapable of having as its value false.

This is not true in the case of unions.

With a union of `string | boolean` a value `x` could be `'banana'` or `true`. We are allowing for all values that are either from the set string or the set boolean. Logically this is equivalent to the OR operator: a value of type `string | boolean` could be one of infinite possible strings or true/false. With union types then, we radically widen the scope of possible values for the type. a

These constraints don't just apply to the values themselves but the methods and properties you can use with the values. For instance a boolean doesn't have the property of `length`. Therefore if you have a union type of `string|boolean` you are going to get an error if you apply `length` to it since **the property must exist on both types that comprise the union**. The way round this is to use type narrowing and execute control flow based on the parameter that is passed to a function that is declared to be of this mixed type.

Here is an example of this:

```ts
function printId(id: number | string) {
  if (typeof id === 'string') {
    // In this branch, id is of type 'string'
    console.log(id.toUpperCase());
  } else {
    // Here, id is of type 'number'
    console.log(id);
  }
}
```
