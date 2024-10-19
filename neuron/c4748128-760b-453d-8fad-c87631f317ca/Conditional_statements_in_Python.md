---
tags: [python]
---

# Conditional statements in Python

## Basic example

```python
input_string = input('Please input a number: ')

if input_string.isnumeric():
    print('The number is accepted')
else:
    print('The input is invalid')

# 5
# The number is accepted

# Using an and in the condition
print('-' * 25)
age = 15
status = None
if age > 12 and age < 20:
    status = 'teenager'
else:
    status = 'not teenager'
print(status)
```

## Else if

```python
savings = float(input("Enter how much you have in savings: "))

if savings == 0:
    print("Sorry no savings")
elif savings < 500:
    print('Well done')
elif savings < 1000:
    print('That is a tidy sum')
elif savings < 10000:
    print('Welcome Sir!')
else:
    print('Thank you')
```

## Nested conditions

```python
snowing = True
temp = -1
if temp < 0:
    print('It is freezing')
    if snowing:
        print('Put on boots')
    print('Time for Hot Chocolate')
print('Bye')
```

## Ternaries/ shorthand conditionals

```python
status = 'teenager' if age > 12 and age < 20 else 'not teenager'
print(status)

num = int(input('Enter a simple number: '))
result = -1 if num < 0 else 1
print('Result is ', result)
```
