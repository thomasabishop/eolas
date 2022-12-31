---
categories:
  - Computer Architecture
  - Hardware
tags: [HDL, nand-to-tetris]
---

# Hardware simulation

In order to test our [HDL](/Computer_Architecture/Hardware_Description_Language.md) files we load them into the hardware simulator program. We will demonstrate this with the following XOR implementation:

![](/_img/xor-addition-four.png)

There are several simulation options:

- interactive
- script-based (where we load a test script into the simulator along with the HDL file
- comparative (running the HDL program against our intended output specified in the `.cmp` file)

The use-cases for each mode are based on the complexity of the chip you are evaluating

## Interactive

The image below shows a basic interactive usage of the simulator. We have uploaded the `Xor.hdl` file into the simulator and changed the input pins to `a=1, b=0` and clicked the calculator icon (representing "evaluation"). This then shows the output and internal pin values for these inputs.

<img src="/home/thomas/repos/computer_science/_img/hardware-sim-basic.png" >

## Script-based

This time we have clicked the script icon to load `Xor.tst`. This loads the test script into the main GUI panel on the left. We can step through each line of the test file and we will see the pin values update in accordance with the test.

When this is run it automatically generates an output file in the source directory at `Xor.out`. This can be viewed within the simulator via the 'View' drop down.

![](/_img/hd-sim-test.png)
