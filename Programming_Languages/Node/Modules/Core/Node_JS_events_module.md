---
categories:
  - Programming Languages
tags:
  - backend
  - node-js
---

# Node.js `events` module

In most cases you won't interact with the `events` module directly since other modules and third-party modules are abstractions on top of it. For instance the `http` module is using events under the hood to handle requests and responses.

Another way of putting this is to say that all events in Node inherit from the `EventEmitter` constructor, which is the class you instantiate to create a new event. At bottom everything in Node is an event with a callback, created via event emitters.

Because Node's runtime is [event-driven](/Programming_Languages/NodeJS/Architecture/Event_loop.md), it is event-emitter cycles that are being processed by the Event Loop, although you may know them as `fs` or `http` (etc) events. The call stack that the Event Loop works through is just a series of event emissions and their associated callbacks.

## Event Emitters

- All objects that emit events are instances of the `EventEmitter` class. This object exposes an `eventEmitter.on()` function that allows one or more functions to be attached to named events emitted by the object.
- These functions are **listeners** of the emitter.

## Basic syntax

```js
const EventEmitter = require("events"); // import the module

// Raise an event
const emitter = new EventEmitter("messageLogged");

// Register a listener
emitter.on("messagedLogged", function () {
  console.log("The listener was called.");
});
```

- If we ran this file, we would see `The listener was called` logged to the console.
- Without a listener (similar to a subscriber in Angular) nothing happens.
- When the emission occurs the emitter works _synchronously_ through each listener function that is attached to it.

## Event arguments

- Typically we would not just emit a string, we would attach an object to the emitter to pass more useful data. This data is called an **Event Argument**.
- Refactoring the previous example:

```js
// Raise an event
const emitter = new EventEmitter("messageLogged", function (eventArg) {
  console.log("Listener called", eventArg);
});

// Register a listener
emitter.on("messagedLogged", { id: 1, url: "http://www.example.com" });
```

## Extending the `EventEmitter` class

- It's not best practice to call the EventEmitter class directly in `app.js`. If we want to use the capabilities of the class we should create our own module that extends `EventEmitter`, inheriting its functionality with specific additional features that we want to add.
- So, refactoring the previous example:

```js
// File: Logger.js

const EventEmitter = require("events");

class Logger extends EventEmitter {
  log(message) {
    console.log(message);
    this.emit("messageLogged", { id: 1, url: "http://www.example.com" });
  }
}
```

_The `this` in the `log` method refers to the properties and methods of `EventEmitter` which we have extended._

- We also need to refactor our listener code within `app.js` so that it calls the extended class rather than the `EventEmitter` class directly:

```js
// File app.js

const Logger = require('./Logger')
const logger = new Logger()

logger.on('messageLogged', function(eventArg){
	console.log('Listener called', eventArg)
}

logger.log('message')
```
