---
title: Prototypical inheritance
categories:
  - Programming Languages
tags: [javascript, OOP]
---

# Prototypical inheritance

## Object oriented basis of JavaScript and nomenclature

As we know, everything in JS that isn't a primitive (i.e. a primitive data type: string, number, boolean, null) is an object. Where an object is a data structure that consists in key:value pairs.

The key is always a string and the value can be: a primitive value, a method (function within an object), an array, another object etc.

> In other object-oriented languages like C# and Java, **functions are called methods** however in JS the term **method** is reserved for function that exists as a property of an objects that contains it.

### Lack of classes in JS

In contrast to more advanced object-oriented languages that are compiled (Java, C#), classes do not really exist in JavaScript. This is due to the prototype-based nature of JS (as we will see) however class-like functionality can be achieved through the use of functions.

Remember in JS that functions can be simple code blocks that execute when called (which is what we mean most of the time by 'function') **or they can be constructor functions which create generic object types from which specific token instances can be generated as objects.**

It is through these 'generic object types' that something akin to a class can be created in JavaScript. (These are sometimes called function-objects )

The following is a good account of the differences between prototypal and class-based languages:

> JavaScript is a prototype-based language, **meaning object properties and methods can be shared through generalized objects that have the ability to be cloned and extended**. This is known as **prototypical inheritance** and differs from **class inheritance**. Among popular object-oriented programming languages, JavaScript is relatively unique, as other prominent languages such as PHP, Python, and Java are class-based languages, which instead **define classes as blueprints for objects**.

### Example of a constructor function

In order to understand prototypes in a moment, it will be helpful to have an example of a constructor function that can be used to generate object instances:

```jsx
/* Create constructor function: */
function Band(mainAlbum, subgenre) {
  // use Pascal for constructor function names
  this.mainAlbum = mainAlbum;
  this.subgenre = subgenre;
}

/* Then to create an object instance: */

var slayer = new Band("Reign in Blood", "thrash metal");
```

## Prototypes

Now that we know class-type functionality enters JS via constructor functions and we have an example, we can look at prototypes.

> Prototypes are a special type of object that exist as a property within function-objects.

Whenever we create an instance-object from constructor function using `new`, the object is given a property with the key `_proto_` . It's value is the `[[prototype]]` property of the function that created, i.e the class of which the object is an instance:

```jsx
{
  _proto_: prototype;
}
```

Note that we use the syntax `[[prototype]]` to indicate that **whilst the value exists, it is not accessible via JavaScript code**, in the manner of a normal object-literal or function-object, because it is the lower-level foundation of first-order JS code.

So how would this work for the `slayer` object we created above?

```jsx
Slayer._proto_ === Band.prototype;
```

The thing is, you do not tend to see this prototype functionality and it is not possible to refer to it as a key:value directly. This is because it is something under-the-hood - it is a process that makes the object-oriented aspects of JS possible but it is not apparent on the first-order level of everyday coding.

The prototype is like a hidden hook that facilitates the generation of objects from class-like constructor functions. With our new awareness of it, we are in a position _to understand how JavaScript works in foundational terms._

## Every non-primitive data type in JS possesses the `Object` prototype

The title above indicates how and why JavaScript establishes its object-oriented data structure.

When we create an object literal (i.e an every day object not a class-like function), under-the-hood JS is making a `new Object()` call in much the same way as we are calling the function-object `Band` when we declare `var slayer = new Band(...)` .

All instance-objects in JavaScript (which, remember is the set of everything that is not a primitive) **inherit from the `Object` keyword**. And, to do this, prototypes are necessary. Now we see how integral prototypes are to JavaScript.

### Examples

Here we create an object-literal and uncover how it has it's basis in the overall `Object` constructor.

```jsx
var slayerMembers = {
  bassist: "Tom Araya",
  guitarist: "Kerry King",
  guitarist: "Jeff Hanneman",
  drummer: "Dave Lombardo",
};

//  slayerMembers._proto_ === Object.prototype
```

Here we create an instance-object off of our `Band` constructor function and trace it back to `Object`

```jsx
var deicide = new Band("Legion", "death metal");

/* deicide object relies on Band prototype:
		
		deicide._proto_=== Band.prototype

Band prototype in turn relies in turn on Object prototype: 

 Band.prototype._proto_=== Object.prototype

*/
```

As the above examples show, ultimately all objects in JavaScript (whether variables, arrays, methods, or functions) eventually lead back to `Object.prototype` .

### How the browser uses prototypes when interpreting code

When the browser interprets your code attempting to access a property or method of an object it runs through the following process:

1. Search on the object itself. If fails →
2. Search the object's prototype. If fails →
3. Search the prototype of the linked object. If fails→
4. Keep going until `Object.prototype` is reached

Clearly with each step we are going to a lower level of abstraction, drawing the curtain back more and more until we got the point where JavaScript effectively stops because any lower would take you into its lower-level parent language (C/C++ depending on how the specific browser executes ECMAScript)

Note (3) is basically the prototype of the component itself. So if you started at (1) with a custom array. At (3) the browser would be querying `Array.prototype` i.e the basic foundational array object.

This explains why the full-name of certain methods on the global objects, includes reference to 'prototype', for instance:

- `toFixed` → `Number.prototype.toFixed()`
- `.trim` → `String.prototype.trim()`.

### Using the function-object of `Object` to create an object literal

As a side-effect of uncovering the prototypical basis of `Object()` we can use it to create an object literal in another way.

Standardly to create a new, empty object literal we would use:

```jsx
var slayerMembers = {...}
```

But now we could just as easily direct the code to `Object()` prototype and achieve the same outcome:

```jsx
let slayerMembers = new Object();
```

### Finding the `[[Prototype]]` of a JS object with `getPrototypeOf()`

We can find out the `[[prototype]]` of a given object in JavaScript with a special method applied to the object in question. The method we use is one of the inherent methods that belong to the `Object()` constructor function: `getPrototypeOf()` .

Here is an example:

```jsx
console.log(Object.getPrototypeOf(slayer));

/*

Returns: 

Object {constructor: , __defineGetter__: ,
 __defineSetter__: , hasOwnProperty: , __lookupGetter__: , …}

*/
```

We could also use the following approach to get the same output however this is not recommended for production:

```jsx
console.log(slayer.__prototype__);
```

The output we get when querying the prototype is the same in each instance.

## But why bother using prototypes in your code?

It is informative to learn how prototypes are behind the object behaviour we observe at a high level in JavaScript and to know that there is a common, lower-level root but when would you actually need to use prototype methods?

The reason is mainly to do with performance and optimisation

> When we create a `deicide` and `slayer` object using the constructor function `Band()` JS creates two _copies_ of the constructor function, one for each generated object. This means there are two instances of `mainAlbum` for each object even though each do exactly the same thing. This wastes memory and performance time every time the script runs.

As a prototype object is an object, we can attach properties and methods to the prototype object. Thus, enabling all the objects created using the constructor function to share those properties and methods. However, the beauty is that the method is applied to the prototype, so it is only stored in the memory once, but every instance of the object has access to it.

```jsx
/* So say I wanted to add an age property to the Band()constructor that all objects of this type have access to. I could do this without wasting memory and without the need to change the original constructor function by referring to the prototype: */

Band.prototype.age = null;

Slayer.age = 25;
```

## Further steps

We are going to stop here for the time being since the primary aim of uncovering prototypes and understanding how they underly all objects and object methods in JS has been achieved.

However it is important to note that there is more that you can do with prototypes. The main additional thing is using the prototypical basis of constructor functions (i.e pseudo-classes) to add and remove key value pairs in the resulting objects. This is useful when you want to create behaviour that is much more like classes in compiled OOP languages.
