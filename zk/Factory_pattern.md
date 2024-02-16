---
categories:
  - DSA
tags:
  - OOP
---

# Factory pattern

The factory pattern pertains to how objects are created in the course of the
code. It is class based.

In this pattern we create a class interface that delegates the responsibility of
object instantiation to its subclasses.

You have a high level class that sits on top of two or more lower level classes
that are semantically related but different in function. Depending on the input
the higher level class receives upon instantiation, it will generate one of the
lower level classes.

### Advantages

- allows for dynamic creation
  - we may not know what objects are required until runtime: the factory allows
    us to cover several eventualities
- decoupling
  - in cases where the lower level classes combine to create something greater
    than their individual parts (see the Alligator example below), they do not
    have to know about each other.
- maintenance
  - allows us to add/remove new object classes easily without changing a lot of
    code.

## Examples

We have two types of notification: email and push. The creation of these two is
handled by a factory class called `NotificationFactory` :

```jsx
class PushNotification {
  constructor(sendTo, message) {
    this.sendTo = sendTo;
    this.message = message;
  }
}

class EmailNotification {
  constructor(sendTo, cc, emailContent) {
    this.sendTo = sendTo;
    this.cc = cc;
    this.emailContent = emailContent;
  }
}
```

```jsx
class NotificationFactory {
  createNotification(type, props) {
    switch (type) {
      case "email":
        return new EmailNotification(
          props.sendTo,
          props.cc,
          props.emailContent
        );
      case "push":
        return new PushNotification(props.sendTo, props.message);
    }
  }
}
```

We first instantiate an instance of the factory and then pass into it the
parameters for either of the two lower level classes.

```jsx
const factory = new NotificationFactory();

// create email notification
const emailNotification = factory.createNotification("email", {
  sendTo: "receiver@domain.com",
  cc: "test@domain.com",
  emailContent: "This is the email content to be delivered.!",
});

// create push notification
const pushNotification = factory.createNotification("push", {
  sendTo: "receiver-device-id",
  message: "The push notification message",
});
```

This example doesn't use a constructor on the factory class, but we could easily
do so. This would remove the need to call a method on the factory class when we
want to instantiate one of the subclasses. Here is another example that does
this with an alligator factory:

```jsx
class ReptilePartFactory {
  constructor(type, props) {
    if (type === "tail") return new TailFactory(props);
    if (type === "torso") return new TorsoFactory(props);
    if (type === "head") return new HeadFactory(props);
  }
}

let alligator = {};
let alligatorProps = {
  tailLength: 2.5,
  color: "green",
  snoutLenth: 1,
};

//gets a tail from the tail factory
alligator.tail = new ReptilePartFactory("tail", alligatorProps);

//gets a torso from the torso factory
alligator.torso = new ReptilePartFactory("torso", alligatorProps);

//gets a head from the head factory
alligator.head = new ReptilePartFactory("head", alligatorProps);
```
