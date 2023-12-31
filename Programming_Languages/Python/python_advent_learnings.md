# Python advent learnings

### Construct paths without hard-coding absolute path

```py
puzzle_input_path = os.path.join(os.path.dirname(__file__), "data/test_input.txt")

```

### Read file by line and store in variable

```py
puzzle_input_path = os.path.join(os.path.dirname(__file__), "data/test_input.txt")

def getPuzzleInput(file_path):
    with open(file_path, "r") as file:
        return [line.strip() for line in file]


puzzle_input = getPuzzleInput(puzzle_input_path)

```

### Conditional tests for members of arrays

Check that all elements are greater than zero:

```py
if all(element >= 0 for element in array):
    print('All elements greater than 0')
```

Check if any element is less than 0:

```py
if any(element < 0 for element in array):
    print('There is an element that is less than 0')
```

### Check for substring:

```py
text = "latest test"
if "test" in text:
    return True
```

### Control flow in loop

```py
for counter_values in games:
    colour = counter_values[1]
    count = int(counter_values[0])
    if colour in initial_values.keys() and count > initial_values[colour]:
        break
else:
    valid_games_count += game_number
```

The use of the `else` clause here is a special feature of Python. The `else` clause after a `for` loop will normally only execute when the loop has finished iterating over the list, but not when the loop is terminated by a `break` statement.

The `else` clause is executed if the `for` loop completes normally. If the `break` statement is executed (i.e., if any count in `counter_values` is greater than the corresponding count in `initial_values`), the `for` loop is terminated and the `else` clause is skipped.

Here the combination of a `for` loop and the `break` statement creates `if, else` logic. If the break condition is not reached, then the `else` block runs for every iteration of the loop.
