---
categories:
  - Computer Architecture
tags: [CPU, electromagnetism, clock]
---

# CPU architecture

At the core of a computer sits the Central Processing Unit. This is the assembly of chips that execute all computation. Instructions are passed to the CPU along the data bus part of the [system bus](/Computer_Architecture/Bus.md) from the memory. The [kernel](/Operating_Systems/The_Kernel.md), also residing in memory, sequences and schedules the sending of data to the CPU and manages requests from the CPU for data in memory.

The CPU comprises three core components:

- Registers (a type of memory positioned on the same chip as the CPU )
- the Arithmetic Logic Unit (ALU)
- the Control Unit (CU)

![](/_img/von_neumann_architecture.jpeg)

> This method of putting together a computer is known as the **Von Neumann Architecture**. It was devised by John von Neumann in about 1945, well before any of the components that would be needed to produce it had actually been invented.

## Registers

This is the part of the CPU that stores data. The memory cells that comprise it do not have [capacitors](/Computer_Architecture/Memory/Memory.md) (unlike RAM) so they cannot store very much data but they work faster, which is what is important. Because their memory capacity is so small, we measure the size of registers in bits rather than bytes.

In terms of speed, registers sit at the top part of the overall [memory hierarchy](/Computer_Architecture/Memory/Memory.md#the-memory-hierarchy).

There are five main types of register in the CPU:

| Register type           | What it stores                                              |
| ----------------------- | ----------------------------------------------------------- |
| Accumulator             | The results of calculations                                 |
| Instruction Register    | The DRAM address of the **instruction** to be processed     |
| Memory Address Register | The DRAM address of the **data** to be processed            |
| Memory Data Register    | The store of the data that is currently being processed     |
| Program Counter         | The RAM address of the **next instruction** to be processed |

## Arithmetic Logic Unit

See [Arithmetic Logic Unit](/Computer_Architecture/CPU/Arithmetic_Logic_Unit.md)

## Control Unit

The CPU's [controller](/Computer_Architecture/Chipset_and_controllers.md). It takes the instructions in binary form from RAM memory (separate from the CPU, but connected) and then signals to the to ALU and memory registers what it is supposed to do to execute the instructions. Think of it as the overseer that gets the ALU and registers to work together to run program instructions.

## The system clock

Whilst modern CPUs and multithreading make it appear as though the CPU is capable of running multiple processes at once, access to the CPU is in fact sequential. The illusion of simultaneous computation is due to the fact the processor is so fast that we do not detect the sequential changes. For this to happen, the CPU needs to have a means of scheduling and sequencing processes. This is made possible through the system clock, hence when talking about the speed of the CPU we do so with reference to _clock speeds_ and the _clock cycle_.

The clock's circuitry is based on a quartz crystal system like that used in watches. At precisely timed intervals, the clock sends out pulses of electricity that cause bits to move from place to place within [logic gates](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md) or between logic gates and [registers](/Computer_Architecture/CPU/CPU_architecture.md#registers). This is covered in greater detail in the discussion of [clock signals in digital circuits](/Electronics_and_Hardware/Digital_circuits/Clock_signals.md).

Simple instructions such as add can often be executed in just one clock cycle, whilst complex operations such as divide will require a number of smaller steps, each using one cycle.

We measure the speed of a chip process within the CPU in **Hertz (Hz)**. One Hertz is equivalent to _1 cycle per second_ where a "cycle" is equivalent to a single clock **tick**. Thus a tick covers a period of 1 second.

A speed of 2GHz for example means two billion cycles per second. This would mean that the clock was completing two billion cycles at each tick. It is clock speed that is being referred to when computers are marketed in terms of the number of Hz a processor possesses.

## Processing cycles

Each "cycle" is the execution of a process that commences once the [kernel](/Operating_Systems/The_Kernel.md) hands control to the CPU. Each cycle follows a sequence of events known as [fetch, decode, and execute](/Computer_Architecture/CPU/Fetch_decode_execute.md).

## Electromagnetism: broader scientific context

Hertz was the scientist who detected [electromagentic waves](/Electronics_and_Hardware/Physics_of_electricity/Electromagnetism.md). We use Hertz as a measure of the frequency of electromatic wave cycles in a signal.

![](/_img/hertz_wave_freq.gif)

As the diagram above shows, a cycle is equal to one ascending and one descending crest. The more cycles per time unit, the greater the Hertz. We see the Hz increase as the number of cycles increases over time.

## Processor cores

// TODO: add to dedicated file

// Add diagram
The vast majority of general purpose computers are multi-core. This means that the CPU contains more than one processing unit. They are best thought of as mini-CPUs within the main CPU since they each have the same overall Von Neumann architecture.

With Intel processors the two main consumer processors are the i5 and i7. The latter has more cores than the former. Consequently it has faster clock speeds and greater concurrency due to increased threads.

### Cache access
// See pp.129 

### History

The development of multi-core processors emerged because practical limits began to be reached when trying to increase the clock speeds of processors. For a period, increased transistor density meant that there were steady increases in clock speeds. This meant that more instructions could be executed per second.

When the 3GHz level was reached it became clear that pushing a CPU beyond this led to excessive heat production and the logic gates not being able to keep up at those speeds. Instead of maxing out the clock rate, attention turned to running multiple instructions in parallel in order to increase performance.
