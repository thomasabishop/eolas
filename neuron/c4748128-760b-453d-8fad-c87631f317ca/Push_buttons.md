---
id: nsrv
tags: [electronics]
created: Tuesday, June 25, 2024
---

# Push buttons

Push buttons are push-to-make switches. This means that they are **on when they
pressed and off when they are not pressed**. A classic example would be the
switches on a keyboard.

Push buttons have four legs that are connected in signal-in and signal-out
pairs.

To create a breakable circuit we would connect a signal-in cable to the top left
at row 23 and a signal-out cable to the bottom-right at row 25.

![Push button legs diagram](/static/push-button-legs.png)

_The correct use of a push button where the button breaks the circuit_

![](/static/correct_push_button.jpg)

To override the switch functionality and just have the button work as a
connector we would connect the signal-in to the row 23 input and the row 23
output.

_The push button being used as simple connector which does not break the
circuit:_

![](/static/incorrect_push_button.jpg)

## Related notes

https://projects.raspberrypi.org/en/projects/button-switch-scratch-pi/1
