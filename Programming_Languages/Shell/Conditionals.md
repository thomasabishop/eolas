---
categories:
  - Programming Languages
tags:
  - shell
---

# Conditionals in Bash

## If statements

- Conditional blocks start with `if` and end with the inversion `fi` (this is a common syntactic pattern in bash)
- The conditional expression must be placed in square brackets with spaces either side. The spaces matter: if you omit them, the code will not run
- We designate the code to run when the conditional is met with `then`
- We can incorporate else if logic with `elif`

## Basic example

```bash
if [ -e $var ]; then
  # Do something
else
  # Do something else
fi
```

## If, else

```bash
if [ "$myMove" -eq "$opponentMove" ]; then
    (( totalScore+=myMove+3 ))
  elif [ $absDiff -eq 2 ] && [ "$myMove" -gt "$opponentMove" ]; then
    (( totalScore+=myMove))
  elif [ $absDiff -eq 2 ] && [ "$opponentMove" -gt "$myMove" ]; then
    (( totalScore+=myMove+6))
  elif [ $absDiff -eq 1 ] && [ "$opponentMove" -gt "$myMove" ]; then
    (( totalScore+=myMove))
  elif [ $absDiff -eq 1 ] && [ "$myMove" -gt "$opponentMove" ]; then
    (( totalScore+=myMove+6))
  fi
```

## Nested conditionals

```bash
if [[ "$line" =~ ^$ ]]; then
  if [[ "$runningTotal" -gt "$highest" ]]; then
    (( highest=runningTotal ))
  fi
  # Reset running sum
  (( runningTotal=0 ))
fi
```
