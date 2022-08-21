---
categories: 
  - DSA
tags: [OOP]
---
# Singleton pattern

As the name suggests, the Singleton pattern is best used in scenarios where you only want to use a single, unique instance of a class. This is for functionality that should only be executed once in the lifecycle of an application. The canonical case would be some kind of bootstrapping process required at initialisation, or initial configuration for an app.

## Use-cases

- Establishing connection to backend database
- API connection (managing tokens so that you are not sending multiple unnecessary calls)
- Configuration settings for an app
- Global state stores in Redux and the React Context API

> With this pattern only one instance of the class can exist. If no instance of the singleton class exists then a new instance is created and returned, but if an instance already exists, then the reference to the existing instance is returned. A singleton should be immutable by the consuming code, and there should be no danger of instantiating more than one of them.

## Implementation

This pattern can be implemented either with a object or a class.

In the example below, a global store for a modern JS application is created using an object.

### Using an object

We ensure singularity by:

- using `const` for the object so that it cannot be reassigned
- using `Object.freeze` so that the fields cannot be overwritten, deleted, or additional fields added

```js
const _data = [];

// Methods to add and retrieve data from the store
const UserStore = {
  add: (item) => _data.push(item),
  get: (id) => _data.find((d) => d.id === id),
};

Object.freeze(UserStore);
export default UserStore;
```

### Using a class

The same process can be created using classes:

```js
class UserStore {
  constructor() {
    this._data = [];
  }

  add(item) {
    this._data.push(item);
  }

  get(id) {
    return this._data.find((d) => d.id === id);
  }
}

const instance = new UserStore();
Object.freeze(instance);

export default instance;
```

Bear in mind that this is really just an ES6 module with `freeze` applied. The only real difference between a singleton and a module is that there should only be one instance of it.

With classes, there is a further step that can be taken to prevent more than once instance of the class being created. This is necessary if you want to be really strict because it is of course possible for a well motivated person to get around the safeguards we established above. We do this by having the class itself check whether there is already an instance of itself. If so, it just returns the already existing instance. We do this by using the self-reference inherent in `this` :

```jsx
class UserStore {
  constructor() {
    if (!UserStore.instance) {
      this._data = [];
      UserStore.instance = this;
    }

    return UserStore.instance;
  }

  //rest is the same code as preceding example
}

const instance = new UserStore();
Object.freeze(instance);

export default instance;
```
