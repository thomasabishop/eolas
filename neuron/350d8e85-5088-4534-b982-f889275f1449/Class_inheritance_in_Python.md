---
tags: [python, OOP]
---

# Class inheritance in Python

We distinguish the **parent/source/superclass** class and the **subclass** that
**extends** it.

A subclass can have more than one parent class that it extends, but this is
atypical.

> The subclass will inherit all attributes and methods of the superclass unless
> it overrides them.

In addition to overriding the methods of the parent we can extend them in the
child. This is a bit like using an abstract.

## Example of class inheritance

```py

class Person:
    """ Our superclass
    """
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def birthday(self):
        print('Happy birthday you were', self.age)
        self.age += 1
        print('You are now', self.age)

    def __str__(self):
        return self.name + ' is ' + str(self.age)


class Employee(Person):
    """ Our subclass that extends `Person`
    """
    def __init__(self, name, age, id):
        super().__init__(name, age)
        self.id = id

    def calculate_pay(self, hours_worked):
        rate_of_pay = 7.50
        if self.age >= 21:
            rate_of_pay += 2.50
        return hours_worked * rate_of_pay

    def __str__(self):
        return super().__str__() + ' - id(' + str(self.id) + ')'
```

### Key points

- We pass the name of the parent class to the child class as a parameter
- We must include all of the parent class's attributes in the constructor of the
  subclass
- We must use a special `super().__init__(..,...)` method to enact the extension
  of the parent. This method references the `__init__` class in the parent.

## Protected/private methods and attributes

> Protected methods and attributes are private to the class but can be accessed
> from any subclass

> Private methods cannot be accessed from anywhere outside of the class

We declare private methods and attributes with a double underscore (`__`). We
declare protected methods and attributes with a single underscore (`_`).

This is **convention**, there are not actually private and protected attributes
or properties.
