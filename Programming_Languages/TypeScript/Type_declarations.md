---
tags:
  - Programming_Languages
  - typescript
---

## Scalar data types

The most basic type level is the one already present in JavaScript itself: the primitive data types: `boolean`, `string` and `number` . These are the types that will be returned from a `typeof` expression.

You can explicitly declare these data types yourself when you create a variable with `var`, `const`, or `let` if you like, but it is generally unnecessary since Typescript is intelligent enough to perform \*\*type inference \*\*\*\*and will know from what you write which type you mean. However with complex code or code that requires mutations, it may be helpful for your own understanding to explicitly declare the type. The syntax is as follows:

````tsx
const age: number = 32;
const name: string = 'Thomas';
const one: boolean = true;
const zero: boolean = false;
````

## Reference types

This is where you want to start declaring types explicitly.

### Arrays

With arrays that you populate at declaration, the type will be inferred but I think it will be helpful to declare them, to help with debugging. If you declare an unpopulated/empty array, it is necessary to declare the empty brackets.

````tsx
const store: number[] = [1, 2, 3]; // Populated array
const store: number[] = [] // Empty array 
````

### Objects

Objects (and classes) are where TypeScript becomes really useful and powerful, especially when you fuse custom types and shape.

In Typescript you don't really have type annotations for the key pairs of an object. This is to say: you don't declare the types as you write the object. Instead you declare a custom type, which is a type-annotated object, and then create instances of that object which **match the shape** of the custom declaration.

So say we have this object:

````jsx
const age = {
  name: 'Thomas',
  yearOfBirth: 1988,
  currentYear: 2021,
	ageNow: function(){ 
		return this.currentYear - this.yearOfBirth;
	}
};
````

We could write this as type with the following:

````tsx
let Age : {
	name: string,
	yearOfBirth: number
	currentYear: number,
	ageNow: () => number
}
````

We use `:` because we are declaring a type not intialising a value of the type.

We could now re-write the first `age` object as an object of type `Age` :

````tsx
let thomas: typeof Age;

thomas = {
  name: 'Thomas',
  yearOfBirth: 1988,
  currentYear: 2021,
  ageNow: function () {
    return this.currentYear - this.yearOfBirth;
  },
};
````

In practise, defining the type and then asserting that a new variable is of this type and then initialising it is rather long-winded. It is better practice to simplify the process by creating a type alias.

````tsx
type Age = {
	name: string,
	yearOfBirth: number,
	currentYear: number,
	ageNow():number, // we type the method on the basis of the value it returns 
}
````

We could then create objects based on this:

````tsx
const thomas: Age = {
	name: 'Thomas',
	yearOfBirth: 1988,
	currentYear: 2021,
	ageNow: function () {
		 return this.currentYear - this.yearOfBirth;
	 },
 };
````

Note that we pass in `:Age` as our type declaration, using the custom type in the same way as we would use `:string` or `number[]` . We can now use this custom type as a type annotation anywhere we use type annotations, it can be used exactly the same way as a scalar or reference type in our code.

Note that when we do this we are using a **type alias**. `Age` is an alias for the type that `thomas` conforms to.

The benefit is that TS will correct you if:

* attempt to assign a type to a value that does not match the custom type declaration (for instance: assigning a string value to a property you have typed as number)
* attempt to add a property that is not specified in the custom type declaration

Although you can subsequently extend the custom type (see below)

### Interlude: object methods

In our example we include a method in the definition of the custom `Age` type. This is fine but it means that when we create instances of `Age` like `thomas` , we have to constantly rewrite the same method with each new instance:

````tsx
...
ageNow: function () {
		 return this.currentYear - this.yearOfBirth;
},
````

This is always going to be the same so it violates DRY to write it every time. In these cases it would be better to either use a class (since the method would carry over to each instance of the class) or, if you want to remain within the realm of objects, create a function that takes an `Age` type as a parameter and then applies the method, for instance:

````tsx
function ageNow(person: Age): number {
	return person.currentYear - person.yearOfBirth;
}

console.log(ageNow(thomas)) // 33 
````

See below for more info on functions \[link\] and classes \[link\].

[Object methods in TypesScript](https://www.reddit.com/r/typescript/comments/m8rck4/object_methods_in_typesscript/)

For more info, see discussion I started on this on /r/typescript

### Interlude: duck typing 🦆

 > 
 > Types are defined by the collection of their properties not their name.

Typescript's implementation of types is as a **structural type system**, which contrasts with a nominal type system. This is often referred to colloquially as 'duck typing': *if it looks like a duck, walks like a duck, and sounds like a duck, it probably is a duck*.

With custom (object types) this means that the following expression of an object of type `Age` doesn't generate an error, TS is satisfied that the shapes of each match.

````tsx
const martha = {
	name: 'Martha',
	yearOfBirth: 1997,
	currentYear: 2021,
	gender: 'female',
 };

const addition: Age = martha;
````

But if we tried to add this extra property whilst defining `martha` as an instance of the custom type `Age` , we would get an error:

````tsx
const martha: Age = {
	name: 'Martha',
	yearOfBirth: 1997,
	currentYear: 2021,
	gender: 'female',
 };
````

````
Type '{ name: string; yearOfBirth: number; currentYear: number; ageNow: () => number; gender: string; }' is not assignable to type 'Age'. **Object literal may only specify known properties, and 'gender' does not exist in type 'Age'.**
````

It means that even though in the following, the variable `point` is never declared to be of the type `Point` , it matches the shape of the custom type. As the structural integrity is maintained, it can be passed to the function without error.

````tsx
interface Point {
  x: number;
  y: number;
}

function logPoint(p: Point) {
  console.log(`${p.x}, ${p.y}`);
}

// logs "12, 26"
const point = { x: 12, y: 26 };
logPoint(point);
````

Shape matching only requires a subset of the object's fields to match:

````tsx
const point3 = { x: 12, y: 26, z: 89 };
logPoint(point3); // logs "12, 26"

const rect = { x: 33, y: 3, width: 30, height: 80 };
logPoint(rect); 
````

## Interfaces

For most purposes the keywords `type` and `interface` are interchangeable. For me, the main decider is that Angular favours `interface` over `type`.

An interface is concept that crosses over from strict OOP.

 > 
 > In Object Oriented Programming, an Interface is a description of all functions that an object must have in order to be an "X". Again, as an example, anything that "ACTS LIKE" a light, should have a `turn_on()` method and a `turn_off()` method. The purpose of interfaces is to allow the computer to enforce these properties and to know that an object of TYPE T (whatever the interface is ) must have functions called X,Y,Z, etc. **An interface is about actions that are allowed, not about data or implementation of those actions.**

 > 
 > But think also about the real semantics of the word: an interface could be a gear stick, a light switch or a door lock accessed with a key. Interfaces allow an external consumer to interact with a complex system that lies behind the interface. In code, the interface represents the ways to use the capabilities of the object.

So with standard OOP interfaces concern the functions that an object possesses. We can include function typings in TS interfaces but generally, an interface/type outlines the structure of a JS *object.*
