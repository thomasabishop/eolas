---
tags:
  - Programming_Languages
  - backend
  - node-js
  - node-modules
---

* Much of the NodeJS core is built around an [asynchronous event-driven architecture](Single-threaded%20asynchronous%20architecture.md) in which certain kinds of objects (called "emitters") emit named events that cause `Function` objects ("listeners") to be called.
* For example: a `fs.ReadStream` emits an event when the file is opened

## Event Emitters

* All objects that emit events are instances of the `EventEmitter` class. These objects expose an `eventEmitter.on()` function that allows one or more functions to be attached to named events emitted by the object. 
* These functions are listeners of the emitter.

## Basic syntax

````js
const EventEmitter = require('events') // import the module

// Raise an event 
const emitter = new EventEmitter('messageLogged')

// Register a listener
emitter.on('messagedLogged', function() {
	console.log('The listener was called.')
})

````

* If we ran this file, we would see `The listener was called` logged to the console.
* Without a listener (similar to a subscriber in Angular) nothing happens.
* When the emission occurs the emitter works *synchronously* through each listener function that is attached to it.

## Event arguments

* Typically we would not just emit a string, we would attach an object to the emitter to pass more useful data. This data is called an **Event Argument**.
* Refactoring the previous example:

````js

// Raise an event 
const emitter = new EventEmitter('messageLogged', function(eventArg) {
	console.log('Listener called', eventArg)
})

// Register a listener
emitter.on('messagedLogged', {id: 1, url: 'http://www.example.com'})

````

## Extending the `EventEmitter` class

* It's not best practice to call the EventEmitter class directly in `app.js`. If we want to use the capabilities of the class we should create our own module that extends `EventEmitter`, inheriting its functionality with specific additional features that we want to add. 
* So, refactoring the previous example:

````js
// File: Logger.js

const EventEmitter = require('events')

class Logger extends EventEmitter {
	log(message){
		console.log(message)	
		this.emit('messageLogged', {id: 1, url: 'http://www.example.com'})
	}
}


````

*The `this` in the `log` method refers to the properties and methods of `EventEmitter` which we have extended.*

* We also need to refactor our listener code within `app.js` so that it calls the extended class rather than the `EventEmitter` class directly:

````js
// File app.js 

const Logger = require('./Logger')
const logger = new Logger()

logger.on('messageLogged', function(eventArg){
	console.log('Listener called', eventArg)
}
		  
logger.log('message')
````
