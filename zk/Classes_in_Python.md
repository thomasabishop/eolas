---
tags: [python, OOP]
---

# Classes in Python

## General points

- We don't need to use `new` when instantiating an instance of a class.
- All properties and methods must be defined in the constructor. This is in
  contrast to JavaScript where the properties in the constructor are those we
  want to initialise when the object is created and where there may be other
  properties and methods that are used outside of the instantiation process.
- In contrast to TypeScript and other OOP languages it is not necessary to
  declare the properties you wish to define in the constructor, outside of the
  constructor. As long as they are defined in the constructor they are
  accessible.

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

# John
```

Key points to note:

- The `__init__` method is the constructor function and must exist on every
  class to define the properties of the class
- `self` is a reference to the class itself and the object it will create, akin
  to `this` in other languages
- You must pass `self` as a parameter to every method (this is a difference from
  JS)
- As with functions, we can use docstrings to document the class. What you write
  here will show up in Intellisense etc

## More complex class

```py
class Person:
	""" An example class to hold a persons name and age"""

	def __init__(self, name, age):
		self.name = name
		self.age = age

	def __str__(self):
		return self.name + ' is ' + str(self.age)

	def birthday(self):
		print ('Happy birthday you were', self.age)
		self.age += 1
		print('You are now', self.age)

	def calculate_pay(self, hours_worked):
		rate_of_pay = 7.50
		if self.age >= 21:
			rate_of_pay += 2.50
		return hours_worked * rate_of_pay

	def is_teenager(self):
		return self.age < 20
```

## Object references

When you log a class you get a reference to its hexadecimal
[memory](Memory.md) reference.

```py
p1 = Person('John', 36)
p2 = Person('Thomas', 34)

print(p1)
print(p2)

# <__main__.Person object at 0x102e75510>
# <__main__.Person object at 0x102e75511>
```

This shows each object is unique. You can also generate a specific ID with the
`id()` method:

```py
print(id(p1))
print(id(p2))

# 4379088272
# 4379088656
```

## Copying objects

The same principle that applies to
[copying functions](Functions_in_Python.md)
applies to copying objects created through classes: redeclaration results in a
duplicate entity. Thus changes to the duplicate will affect the original.

This becomes obvious when you use `id()` but otherwise might not be apparent. To
copy you should therefore declare a new instance of the class.

### The `str` method

The memory reference isn't very helpful for viewing the data contents. To get
around this we can use the builtin `__string__` method which automatically logs
whatever properties you put in there:

```py
class Person:
    """ An example class to hold a persons name and age"""

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return self.name + ' is ' + str(self.age)

p3 = Person('Thomas', 34)
print(p3)
# Thomas is 34
```

## Deleting objects

You might want to delete an object reference because:

- the variable referencing the object goes out of scope
- the variable is set to `None`

After the `del` statement is applied to a variable that holds an object, the
object will no longer be available and any attempt to reference it will result
in an error.

```py
p1 = Person('J-Man', 76)
del p1
```
