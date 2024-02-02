---
categories:
  - DSA
tags: [OOP]
---

# Module pattern

> Come back and compare this with learning from Node.js

With the module design pattern we create encapsulation: the variables and
functions (as methods) are kept private inside the module and cannot be
overwritten. This design pattern is familiar from Node.js development: every
package you import into your project and download from NPM is a module.

Generally you will create the module as a class, import it and then instantiate
a new instance. However for private development, you could just as well use an
object and duplicate it with `Object.create`.

## Example

Here is an example of a simple module that returns the age of a person.

```js
export default class Age {
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
}
```

```js
const martha = new Age("Martha", 1997);
console.log(martha.age); // 24
```

## Controlling access

In the example above, `aValue` could be edited in instantiations of the class.
Given that modules should not be overwrittable, you could make it a private
property on the class. The benefit of getters and setters is that they dictate
what can be modified and retrieved from the module. So if you use `get` and
`set` you can prevent overwrites.

## Object modules

If you want to use an object instead of a class, you have to take greater care
to ensure that the objects are not overwritable. **Also you cannot use the `#`
modifier to make properties private.**

- Use getters and setters for updating and retrieving values
- Use `Object.seal` to prevent changes to the parent object
- Instead of using getters and setters, for individual properties you can set
  `writable` to be `false` for properties that you don't want changed

There are examples of each in the following:

```jsx
export const age = {
  name: "",
  birthYear: new Number(),
  currentYear() {
    return new Date().getFullYear();
  },
  get age() {
    return this.currentYear() - this.birthYear;
  },
};

Object.seal(age);
Object.defineProperty(age, "aValue", {
  value: 6,
  writable: false,
});
```
