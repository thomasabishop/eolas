---
categories:
  - Computer Architecture
  - Hardware
tags: [HDL, nand-to-tetris]
---

# Hardware simulation

In order to test our [HDL](/Computer_Architecture/Hardware_Description_Language.md) files we load them into the hardware simulator program shown below:

There are several simulation options:

- interactive
- script-based (where we load a test script into the simulator along with the HDL file
- comparative (running the HDL program against our intended output specified in the `.out` file)

The image below shows a basic interactive usage of the simulator. We have uploaded the `Xor.hdl` file into the simulator and changed the input pins to `a=1, b=0` and clicked the calculator icon. This then shows the output and internal pin values for these inputs.

<img src="/home/thomas/repos/computer_science/_img/hardware-sim-basic.png" >
