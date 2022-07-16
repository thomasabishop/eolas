---
tags:
  - Programming_Languages
  - backend
  - node-js
---

# Global object

 > In Node every function and variable should be scoped to a module. We should not define functions and variables within the global scope.

* In Node the equivalent to the browser's `Window` object is `global`. The properties and methods that belong to this method are available anywhere in a program. 

* Just as we can technically write `Window.console.log()`, we can write `global.console.log()` however in both cases it is more sane to use the shorthand.

* However if we declare a variable in this scope in browser-based JavaScript, this variable becomes accessible via the `Window` object and thus is accessible in global scope. The same is not true for Node. If you declare a variable at this level it will return undefined. 

* This is because of Node's modular nature. If you were to define a function `foo` in a module and then also define it in the global scope, when you call `foo`, the Node interpreter would not know which function to call. Hence it chooses not to recognise the global `foo`, returning undefined.
