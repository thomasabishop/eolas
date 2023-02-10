---
categories:
  - Programming Languages
tags:
  - backend
  - node-js
---

# Modules

> Modules are partitioned files where we define our variables and functions. Values defined in modules are scoped to that specific module, constituting a unique name space. This avoids name clashes in large programs.

- Every file in a Node application is considered a module.

- The variables and methods in a module are equivalent to `private` properties and methods in object-oriented programming.

- If you wish to use a function or variable defined in a module outside of its modular container you need to explicitly export it and make it public.

## Structure of a module

Node keeps an internal record of the properties of a module. To see this we can log the property `module` to the console.

```js
// index.js
console.log(module);
```

This gives us:

```plaintext
Module {
 id: '.',
 path: '/home/thomas/repos/node-learning',
 exports: {},
 filename: '/home/thomas/repos/node-learning/index.js',
 loaded: false,
 children: [],
 paths: [
   '/home/thomas/repos/node-learning/node_modules',
   '/home/thomas/repos/node_modules',
   '/home/thomas/node_modules',
   '/home/node_modules',
   '/node_modules'
 ]
}
```

## Exports

- Whenever we export a property or method from a module we are directly targeting the `exports` property of the module object.
- Once we add exports to a file they will be displayed under that property of the module object.
- We can export the entire module itself as the export (typically used when the module is a single function or class) or individual properties.

### Exporting a whole module

_The example below is a module file that consists in a single function_

```js
module.exports = function (...params) {
  // function body
};
```

Note the module is unnamed. We would name it when we import:

```js
const myFunction = require("./filenme");
```

### Exporting sub-components from a module

In the example below we export a variable and function from the same module. Note only those values prefixed with `exports` are exported.

```js
exports.myFunc = (...params) => {
  // function bod[]()y
};

exports.aVar = 321.3;

var nonExportedVar = true;
```

This time the exports are already name so we would import with the following:

```js
const { myFunc, aVar } = require("./filename");
```

We can also do the exporting at the bottom when the individual components are named:

```js
const myNamedFunc = (val) => {
  return val + 1;
};

function anotherNamedFunc(val) {
  return val * 2;
}

// This time we export at the bottom
exports.myNamedFunc = myNamedFunc;
exports.differentName = anotherNamedFunc; // We can use different names

// Or we could export them together
module.exports = { myNamedFunc, anotherNamedFunc };
```

The import is the same:

```js
const { myNamedFunc, anotherNamedFunc } = require("./modules/multiExports");
```

## Structuring modules

The techniques above are useful to know but generally you would want to enforce a stricter structure than a mix of exported and private values in the one file. The best way to do this is with a single default export.

Here the thing exported could be a composite function or an object that basically acts like a class with methods and properties.

_Export a composite single function_

```js

module.exports = () => {
	foo() {...}
	bar() {...}
}
```

_Export an object_

```js

module.exports = {
	foo : () => {...},
    bar: () => {...}
}
```

**Both of these structures would be referred to in the same way when importing and using them.**

Or you could export an actual class as the default. This is practically the same as the two above other than that you would have to use `new` to initiate an instance of the class.

```js
export default class {
  foo() {}
  bar() {}
}
```

Every method and property within the export will be public by default, whether it is an object, class or function. If you wanted to keep certain methods/properties private, the best approach is to define them as variables and functions within the module file but outside of the `export` block.
