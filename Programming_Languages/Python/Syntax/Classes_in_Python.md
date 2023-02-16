---
categories:
  - Programming Languages
tags: [python, OOP]
---

# Classes in Python

## General points

- We don't need to use `new` when instantiating an instance of a class.
- All properties and methods must be defined in the constructor. This is in contrast to JavaScript where the properties in the constructor are those we want to initialise when the object is created and where there may be other properties and methods that are used outside of the instantiation process.
- In contrast to TypeScript and other OOP languages it is not necessary to declare the properties you wish to define in the constructor, outside of the constructor. As long as they are defined in the constructor they are accessible.

## Basic syntax

```py
class Person:
	""" An example class to hold a persons name and age"""

	def __init__(self, name, age):
		self.name = name
		self.age = age

	def birthday(self):
        print('Happy birthday you were', self.age)
        self.age += 1
        print('You are now', self.age)


p1 = Person('John', 36)
p2 = Person('Thomas', 34)
print(p1)
print(p2)

print(p1.name)
# <__main__.Person object at 0x102e75510>
# <__main__.Person object at 0x102e75511>
# John
```

Key points to note:

- The `__init__` method is the constructor function and must exist on every class to define the properties of the class
- Every object that the class instantiates is a unique intem in memory as indicated by the hexadecimal log.
- `self` is a reference to the class itself and the object it will create, akin to `this` in other languages
- You must pass `self` as a parameter to every method (this is a difference from JS)
- As with functions, we can use docstrings to document the class. What you write here will show up in Intellisense etc

## The `str` method
