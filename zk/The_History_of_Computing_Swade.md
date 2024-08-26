---
title: The_History_of_Computing_Swade
tags: [literature, computer-history]
created: Friday, August 23, 2024
---

| Title                                               | Author      | Publication date | Resource type |
| --------------------------------------------------- | ----------- | ---------------- | ------------- |
| The History of Computing: A Very Short Introduction | Doron Swade | 2022             | Book          |

## Timeline

A typical timeline approach rooted in major innovations.

- Ancient aids to counting: knotted cords and notched sticks
- Ancient aids to calculation: counting boards and abacii
- Early mechanical calculator devices in the 17th century (number wheels,
  Pascal, Leibniz)
- Modern aids to calculation: slide rules following the discovery of
  [logarithms](Logarithms.md)
- Mechanised, automated calculating engines of Babbage in the 19th century
- Punched-card machines leading to IBM in the early 20th century
- Analogue and electro-mechanical computers of the early 20th century inclusive
  of wartime computers
- Early valve-based (vacuum-tubed) digital computers (again wartime and early
  Cold War)
- The invention of the transistor and first fully-digital computers
- The invention of [integrated_circuits](Integrated_circuits.md)
- Supercomputers
- Minicomputers
- Consumer personal computers
- Internet and later, Web
- Smart phones

First three phases of digital electronic computers:

- Wartime up to 1950s vacuum-tube era
- Transistor era up to 1963
- First microchip era ending in early 1970s

## Mechanical calculating devices in the 17th century

Focus was chiefly on creating a desktop calculator capable of four-function
arithmetic.

![Photograph of Pascaline](../img/pascaline.jpg)

![Photograph of replica of Leibniz stepped drum machine](../img/leibniz-stepped-drum.jpg)

The main contenders were the Pascaline of #Pascal (which only did cumulative
addition) and the wheel or "stepped drum" calculator of #Leibniz that could do
all operations (in theory).

Subsequent designs were based on these artefacts. In practice, neither worked
consistently well with the carriage of tens remaining a sticking point.

![Photograph of Arithmometer](../img/arithmometer.jpg)

![Photograph of Comptometer](../img/comptometer.png)

The arithmometer (crank driven) and comptometer (key-driven) were descendents of
the Leibniz design that became commercially viable by the 19th century along
with other mechanical calculators. In the US, Burroughs dominated the market.

## Babbage: mechanized, automated calculation

> I wish to God these calculations had been executed by Steam (#Babbage)

With Babbage's machines we see an approach to computation that can only be
understood against the backdrop of the Industrial Revolution in which they were
conceived.

The idea is that the machine is a factory and number is the product. In the same
way as the mechanised looms created textiles. It is the extension of a model of
industrial production from goods/commodities to information.

Babbage conceived two machines: the Difference Engine (DE) and the Analytical
Engine (AE). Neither were successfully built in his lifetime. The DE preceded
the AE and was basically an advanced mechanical calculator whereas the AE
approximated a general purpose computer.

Despite this, with the Difference Engine, in contrast to preceding _aids to
calculation_, the steps of the computational algorithm were no longer directed
by human intelligence but by internal rules embodied in the mechanism and
automatically generated.

### Difference Engine

The DE's single purpose was to calculate and output mathematical tables such as
the results of polynomial equations. The idea was that you would input the
variables of the equation and activate the machine and it would output the
results. Associated with this concept was the idea that once it arrived at the
answer a bell would ring and the machine would _halt_. This influenced #Turing
later. It was non-programmable and designed for a specific set of calculations.

### Analytical Engine

Conceived as a general-purpose computing machine capable of perfoming a wide
range of calculations, programmable using punched cards similar to those used
with Jacquard looms.

It more resembled modern computers in that Babbage used concepts that would
later translate into the von #Neumann architecture. There was a "mill" (CPU),
"store" (memory) and input/output mechanisms. It also had a concept of looping
and conditional branching.

### Lovelace's insight

A central idea of Ada #Lovelace, expressed in her notes on the Analytical Engine
is that **number can represent entities other than quantity**.

If we assign meaning to number then results arrived at by operating on number
according to rules can say things about the world when mapped back onto the
world using the meanings assigned to them.

Lovelace's insight was that the potential of computin lay in the power of
machines to manipulate representations of the world contained in symbols.

## Analogue computers

Both digital and analogue computers are automatic. They differ in _how they
represent quantities_ and how their outputs are derived.

With digital machines, quantity is represented as a string of discrete digits.

With analogue machines, quantity is a physical property _in itself_ rather than
a representation. This could be, for example, the lowering of a weight, the flow
of a liquid or an electrical charge.This physical behaviour is **analagous** to
the system that is being modelled. Quantities are continuously variable values
rather than discrete (discontinuous values).

Digital machines produce results by _calculation_ whereas analogue machines
produce results by _measurement_, e.g. the height of liquid in a tank or the
time it taks for a tank to be emptied,

### Examples

#### The Phillips Hydraulic Computer

This used fluid to model the workings of the British economy. It consisted of a
series of transparent plastic tanks and pipes which were fastened to a wooden
board.

![Philips Hydraulic Computer](../img/hydraulic_computer.jpg)

Each tank represented some aspect of the UK national economy and the flow of
money around the economy was illustrated by coloured water. At the top of the
board was a large tank called the treasury. Water (representing money) flowed
from the treasury to other tanks representing the various ways in which a
country could spend its money. For example, there were tanks for health and
education. To increase spending on health care a tap could be opened to drain
water from the treasury to the tank which represented health spending.

#### Bush's Differential Analyser

This was designed to solve differential equations by integration. In contrast to
the Philips Computer it was general enough to be used to solve problems from
different contexts. Examples of these contexts: heat flow, ballistics,
mechanics, population growth, chemical interactions, astronomy.

![Differential Analyser](../img/differential_analyser_bush.jpg)

It was about the size of a room and used shafts, motgors, discs and wheels to
work.

### Historiography

There is a tendency in the history of computing to downplay or diminish the
contribution of analogue computing devices and to present them as just an
inferior precursor to the inevitable dominance of digital electronic computers.

This is ahistorical and inaccurate.

Analogue (and electromechanical devices) overlapped with and coexisted with
digital devices for 40 years, spanning the first three generations of digital
electronic devices. The term "analogue" itself only came about when the need
arose to distinguish digital devices from other types of computer; they were not
"rivals" before this.

### Electro-mechanical devices

Electro-mechanical devices (also known as "electronic analogue computers") are a
sort of midway between full digital devices and analogue computers.

Their heyday was roughly 1935 - 1945.
