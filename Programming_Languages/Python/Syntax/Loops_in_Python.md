---
categories:
  - Programming Languages
tags: [python]
---

# Loops in Python

## While

```python
count = 0
print('Starting')
while count < 10:
    print(count, '', end='')
    count += 1

print()  # not part of the while loop
print('Done')

"""
Starting
0 1 2 3 4 5 6 7 8 9
Done
"""

```

> There are no `do while` loops in Python

## For

There are three main types of `for` loop in Python and they all use the `for...in` clause:

1. Traditional `for` loop with range:

   ```py
   for i in range(0, 5):
       print(i)
   ```

   This is equivalent to the following in JavaScript:

   ```js
   for (let i = 0; i <= 5: i++) {
       console.log(i)
   }
   ```

2. `for` loop with iterable:

   ```py
   fruits = ["apple", "banana", "cherry"]
   for (fruit in fruits):
       print(fruit)
   ```

3. `for` loop with `enumerate()` function:
   Iterate over an iterable whilst also keeping track of the index of the current element:
   ```py
   for index, fruit in enumerate(fruits):
       print(f"Index {index}: {fruit}")
   ```

### Further examples of `for in range()` loops

// TODO: segment the examples into dedicated sections

```python
# Loop over a set of values in a range
print('Print out values in a range')
for i in range(0, 10):
    print(i, ' ', end='')
print()
print('Done')

"""
Print out values in a range
0  1  2  3  4  5  6  7  8  9
Done
"""

# Now use values in a range but increment by 2
print('Print out values in a range with an increment of 2')
for i in range(0, 10, 2):
    print(i, ' ', end='')
print()
print('Done')

"""
Print out values in a range with an increment of 2
0  2  4  6  8
Done
"""

# Now use an 'anonymous' loop variable
for _ in range(0, 10):
    print('.', end='')
print()

print('-' * 25)

# Illustrates use of break statement
print('Only print code if all iterations completed')
num = int(input('Enter a number to check for: '))
for i in range(0, 6):
    if i == num:
        break
    print(i, ' ', end='')
print('Done')

"""
Only print code if all iterations completed
Enter a number to check for: 7
0  1  2  3  4  5  Done
"""

# Illustrates use of continue statement
for i in range(0, 10):
    print(i, ' ', end='')
    if i % 2 == 1:
        continue
    print('hey its an even number')
    print('we love even numbers')
print('Done')

"""
0  hey its an even number
we love even numbers
1  2  hey its an even number
we love even numbers
3  4  hey its an even number
we love even numbers
5  6  hey its an even number
we love even numbers
7  8  hey its an even number
we love even numbers
9  Done
"""

# Illustrates use of else statement with a for loop
print('Only print code if all iterations completed')
num = int(input('Enter a number to check for: '))
for i in range(0, 6):
    if i == num:
        break
    print(i, ' ', end='')
else:
    print()
    print('All iterations successful')
print('Done')


"""
Only print code if all iterations completed
Enter a number to check for: 6
0  1  2  3  4  5
All iterations successful
Done
"""

```
