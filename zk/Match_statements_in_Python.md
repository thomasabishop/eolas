---
categories:
  - Programming Languages
tags: [python]
---

# Match statements in Python

> A `match` statement is the equivalent of a switch or case statement in Python

```python
command = input("What are you doing next? ")

match command:
    case "quit":
        print("Goodbye!")
    case "look":
        print("Looking out")
    case "up" | "down":
        print("up or down")
    case _:
        print("The default")

"""
What are you doing next? up
up or down
"""

match command.split():
    case ["go", "left"]:
        print("go left")
    case ["go", ("fast" | "slow")]:
        print("go fast or slow")

point = (3, 3)
match point:
    case (x, y) if x == y:
        print(f"The point is located on the diagonal Y=X at {x}.")
    case (x, y):
        print(f"Point is not on the diagonal.")
"""
The point is located on the diagonal Y=X at 3.
"""
```
