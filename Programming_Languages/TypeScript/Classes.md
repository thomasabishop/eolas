---
categories:
  - Programming Languages

tags: [typescript, OOP]
---

# Classes

## Type declarations for classes

TypeScript offers full type annotations for classes. It also introduces several TypeScript-specific options (control access modifiers, interfaces etc) that do not exist in JavaScript but which seek to bring it into closer alignment with more strict object-oriented languages like Java and C#.

A class in JavaScript:

```js
class Age {
  constructor(name, birthYear) {
    this.name = name;
    this.birthYear = birthYear;
  }
  currentYear() {
    return new Date().getFullYear();
  }
  get age() {
    return this.currentYear() - this.birthYear;
  }
  get dataOutput() {
    return `${this.personName} is ${this.age} years old`;
  }
}
```

The same class in TypeScript:

```ts
class Age {
  personName: string;
  birthYear: number;
  constructor(personName: string, birthYear: number) {
    this.personName = personName;
    this.birthYear = birthYear;
  }
  currentYear(): number {
    return new Date().getFullYear();
  }
  get age(): number {
    return this.currentYear() - this.birthYear;
  }
  get dataOutput(): string {
    return `${this.personName} is ${this.age} years old`;
  }
}
```

The main points to note are:

- methods must specify their return type, as with [functions](Functions.md)
- the constructor function must specify its parameters' types
- we must declare the types of any properties we intend to use at the start of the class.

### Instantiating a class

In order to create an object instance of `Age`, we can use the standard constructor function, viz:

```js
const mum = new Age("Mary Jo", 1959);
console.log(mum);

/* Age { personName: 'Mary Jo', birthYear: 1959 } */
```

But given that classes define objects, we can also now use `Age` as a new custom type and define an object that way

```jsx
const thomas: Age = new Age("Thomas", 1988);
```

### Without constructor

If your class does not use a constructor, you still need to define your class property types at the top:

```tsx
class Dummy {
  aNum: number = 4;
  get getSquare(): number {
    return this.aNum * this.aNum;
  }
}
```

## Interfaces

In most cases the difference between using the `type` and `interface` keywords when defining a custom type is marginal however interfaces are specifically designed for classes and OOP style programming in TypeScript. This is obviously most apparent in a framework like Angular where interfaces are used heavily.

When we use an interface with a class we are asserting that the class must have certain properties and methods in order to qualify as that type. This is most helpful when you are working with several developers and want to ensure consistency.

Let's say we have the following interface:

```ts
interface Person {
  firstName: string;
  secondName: string;
  age: number;
  employed: () => boolean;
}
```

Now we want to create a class that must share this shape. We go ahead and create the class and say that it **implements** `Person` :

```ts
class Programmer implements Person {
// If the below are not included, TS will generate an error
	firstName: string,
	secondName: string,
	age: number,
	employed: () => boolean
}
```

## Inheritance

### `implements` vs `extends`
