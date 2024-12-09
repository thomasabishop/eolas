---
tags:
  - design-patterns
---

# Command pattern

This is typically used when you want to sequence a fairly large number of
actions in a series with the option to undo or reverse them. Similarly to the
mediator it has a one-to-many architecture (there is a central class that
sequences the commands which are handled by other classes) but in addition to
sending and routing requests between colleagues, it keeps a central store of
them and can reverse actions.

The typical example is a calculator. Will will generate this using constructor
function syntax, rather than ES6 class syntax.

You have a bunch of arithmetic functions:

```jsx
function add(x, y) {
  return x + y;
}
function sub(x, y) {
  return x - y;
}
function mul(x, y) {
  return x * y;
}
function div(x, y) {
  return x / y;
}
```

Then a generalised `Command` class that has three parameters: undo, execute, and
return a value:

```jsx
var Command = function (execute, undo, value) {
  this.execute = execute;
  this.undo = undo;
  this.value = value;
};
```

We then create the specific commands by combining the functions and the
`Command` class:

```jsx
var AddCommand = function (value) {
  return new Command(add, sub, value);
};

// We would create one of these classes for each of the four operations
```

So now the `add` and `subtract` functions slot into `execute` and `undo` on the
`Command` class.

Finally we create the centralised command class that will return values based on
the individual commands it sequences and issues, store them and remove them:

```jsx
var Calculator = function () {
    var current = 0;
    var commands = [];

    function action(command) {
        var name = command.execute.toString().substr(9, 3);
        return name.charAt(0).toUpperCase() + name.slice(1);
    }

    return {
        execute: function (command) {
            current = command.execute(current, command.value);
            commands.push(command);
            log.add(action(command) + ": " + command.value);
        },

        undo: function () {
            var command = commands.pop();
            current = command.undo(current, command.value);
            log.add("Undo " + action(command) + ": " + command.value);
        },

        getCurrentValue: function () {
            return current;
        }
    }
```

```jsx
calculator.execute(new AddCommand(100));
calculator.execute(new SubCommand(24));
calculator.execute(new MulCommand(6));
calculator.execute(new DivCommand(2));
```

Or undo them with:

```jsx
calculator.undo();
```
