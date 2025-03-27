---
tags: [literature]
created: Tuesday, March 25, 2025
---

# _Code Craft: The Practice Of Writing Excellent Code_

## Clarity not brevity

> Readability is the best single criterion of program quality: If a program is
> easy to read, it is probably a good program; if it is hard to read, it
> probably isn't good. -- _The Elements of Programming Style_ (Kernighan and
> Plaugher, 1978)

Whenever you can choose between concise (but potentially confusing) code and
clear (but potentially tedious) code, use code that reads as intended, even if
it’s less elegant.

## Initialise all variables at their points of declaration

The uninitialized value may turn into a problem further down the line.

## Declare variables as late as possible

Place the variable as close as possible to its use. This prevents it from
confusing other parts of the code. It also clarifies the code using the
variable. You don’t have to hunt around to find the variable’s type and
initialization; a nearby declaration makes it obvious.

## Naming

- Choose names from the perspective of an inexperienced reader, not from your
  internal, knowledgeable perspective.

- If you can’t come up with a good name, then you might need to change your
  design. It’s an indication that something might be wrong.

- Use clear names even if they are long. It doesn’t matter that a name is long
  if its meaning is unambiguous.

- Avoid redundant words in names. Specifically, avoid these words in type names:
  _class_, _data_, _object_, and _type_.

## Self-documenting code

This can be achieved with good naming alone if you are clever about it. It
doesn't necessarily require automated tools or excessive commentary.

### Scope

- With smaller, more specific scope we can name things in a more intuitive and
  expressive way. For example `Tree.countApples()`, `Tree.hasApples` rather than
  `Tree.countApplesInTree()`.

### Good presentation

- Make the “normal” path through your code obvious. Error cases should not
  confuse the normal flow of execution. Your if-then-else constructs should be
  ordered _consistently_ (i.e., always place the “normal” case before the
  “error” case, or vice versa).

- _One function, one action_. Make that your mantra.

- Public information should come first, since this is what the class user needs
  to see. Put the **private implementation details at the end**, since they are
  less important to most readers.

### Comments

- Explain _why_ not _how_. Your comments should not describe how the program
  works. You can see that by reading the code. The code is the definitive
  description of how the code works. You should instead focus on describing why
  something is written the way it is or what the next block of statements
  ultimately achieves.
