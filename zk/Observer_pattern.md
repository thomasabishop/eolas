---
tags: [OOP]
---

# Observer pattern

The Observer design pattern is also known as the 'publish/subscribe' pattern.

> The observer pattern is a software design pattern in which an object, called
> the subject, maintains a list of its dependents, called observers, and
> notifies them automatically of any state changes, usually by calling one of
> their methods.

The observer pattern instantiates a **one-to-many** relationship between the
subject and its observers: when one object updates, it notifies many other
objects that it has been updated.

This is another design pattern that is useful when implementing a global state.
When the subject updates its subjects must follow suit and adapt to its changes.
Here the subject is the instrument for maintaining the global state.

## Subject class

This class maintains a list of observers that will be notified when it is
updated. It should have the following attributes:

- array of existing observers
- an `addObserver` method which pushes an observer onto the observers array
- a `removeObserver` method that does the opposite
- a `notify` method that broadcasts to the observers that a change has happened

## Observer class

Observers must implement an `update` method that will be called by the subject's
`notify` method.

## Example

```js
class Subject {
  observers = [];

  getCurrentTime() {
    var d = new Date();
    return `${d.getHours()}:${d.getMinutes()}:${d.getSeconds()}`;
  }

  addObserver(...observer) {
    for (const o of observer) {
      this.observers.push(o);
    }
  }
  removeObserver(observer) {
    const match = this.observers.findIndex((element) => element === observer);
    this.observers.splice(match, 1);
  }
  notify() {
    for (const o of this.observers) {
      o.update(`I was updated at ${this.getCurrentTime()}`);
    }
  }
}

class ObserverA {
  state = "I am observer A";
  update(newState) {
    this.state = newState;
  }
}

class ObserverB {
  state = "I am observer B";

  update(newState) {
    this.state = newState;
  }
}

let subjectInstance = new Subject();
let obsAInstance = new ObserverA();
let obsBInstance = new ObserverB();

subjectInstance.addObserver(obsAInstance, obsBInstance);

subjectInstance.notify();
console.log(obsBInstance.state);
```
