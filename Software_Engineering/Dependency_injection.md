---
categories:
  - Software Engineering
tags: [OOP]
---

# Dependency injection

Dependency injection is an object-oriented design pattern that allows for the decoupling of dependencies between objects making code more maintainable, testable and modular.

The basic idea is to resist having any class (C) depend on the specific implementation details of any other class to which it sustains a dependency (D). If we can abstract the implementation of D, this makes it easier to swap-out and change C's dependencies later on without having to re-write C as a result of changes to D.

This is where interfaces become very helpful because they are schematic representations of the main methods in a given class (basically their names, params and return value). As long as this is kept consistent in D when changes are made, you avoid conflicts when changes or refactorings are made to D.

## Example

In the example to follow we will have two classes:

- `ConsoleLogger`
  - This will simply log something and be a dependency for the class below

* `UserService`
  - This will depend on `ConsoleLogger`

First we define an interface for the dependency:

```ts
interface ILogger {
  log(message: string): void;
}
```

So this is a class that has a single method `log` which receives a `message` string as an argument and returns a side-effect.

Now we'll implement this class:

```ts
class ConsoleLogger implements ILogger {
  log(message: string): void {
    console.log(message);
  }
}
```

Now we create a class that depends on it:

```ts
class UserService {
  private logger: ILogger;

  constructor(logger: ILogger) {
    this.logger = logger;
  }

  createUser(username: string): void {
    // ... (some logic to create a user)
    this.logger.log(`User created: ${username}`);
  }
}
```

We can see that the constructor references the `Logger` interface. Thus we inject the dependency when instantiating `UserService`:

```ts
// First implement our earlier class that matches the `Logger` in its shape:
const logger: ILogger = new ConsoleLogger();

// Then pass it as a dependency:
const userService: UserService = new UserService(logger);
userService.createUser("John Doe");
```
