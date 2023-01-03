---
categories:
  - Electronics
  - Hardware
tags: [logic-gates, binary, nand-to-tetris]
---

# Multiplexors (MUX)

A multiplexor takes two inputs (A,B) plus a third input SEL (for "select"). Applying a value to SEL toggles the output between A and B.

Multiplexers can be used to build larger circuits by connecting the output of one multiplexer to the input of another. They are often used to implement data selection and switching in digital systems

```
if (sel==0)
    out=a
else
    out=b
```

<iframe src="https://circuitverse.org/simulator/embed/multiplexor-5406f205-8ac7-4c5b-a1ba-861c5face8d3?theme=default&display_title=false&clock_time=true&fullscreen=true&zoom_in_out=true" style="border-width:; border-style: solid; border-color:;" name="myiframe" id="projectPreview" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="400" width="600" allowFullScreen></iframe>

## Programable gates

One of the main use cases of multiplexors is to implement programmable gates. These are gates where the logic can be switched. For example an ANDMUXOR gate uses the SEL value to toggle the operation of a gate between AND and OR for its two inputs A and B
