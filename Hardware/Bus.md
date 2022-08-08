---
tags:
  - Hardware
  - motherboard
---

# Bus
A bus is a communication system that transfers data between components inside a computer, or between computers.  

## Main buses 

### System bus
The primary pathway between the CPU and [memory](Memory/Basics.md). It comprises the **data bus**  that transfers data from the memory to the CPU and the **address bus** which transmits requests from the CPU to memory.

### Internal bus
Connects local devices for example the harddisk to the CPU.

### External bus
Connects peripheral devices such as disks and printers to the [motherboard](Motherboard.md)

### Expansion bus
Allows expansion boards to access the CPU and memory. 

### Frontside bus
Main computer bus that determines data transfer rate speed and is the primary data transfer path between the CPU, RAM and other [motherboard](Motherboard.md) devices.

### Backside bus
Transfers secondary cache (L2 cache) data at faster speeds, allowing more efficient CPU operations

## Bus standards

### Parallel and serial transmission types
There is a distinction between buses that use serial and buses that use parallel transmission. They are distinguished by the way in which data in the form of bits is transferred from one point to another, along the bus.

Serial Transmission is the type of transmission in which a single communication link is used to transfer the data from an end to another. On other hand Parallel Transmission is the transmission in which multiple parallel links are used that transmit each bit of data simultaneously.

<img src="../img/serial-transmission.jpg" width="800px"/>
<img src="../img/parallel-transmission.jpg" width="800px"/>

* Serial buses are cheaper to implement than parallel buses
* Serial buses operate at greater [latency](/Hardware/Bus.md#latency) than parallel buses
## Latency 

Latency means _delay_: the delay from the time the data is requested until the time it arrives. In the context of a microprocesser and buses a key locus of latency would be between the time a request takes to travel accross the system bus from the CPU to the memory.

// TODO: Add explanation of bandwidth in the context of Hertz


## Standards
The mode of transmission is used to distinguish the different bus standards.

SCSI (Small Computer System Interface) and ATA (Advanced Technology Attachment) are used for hard drive devices (i.e. internal buses). USB (Univeral Serial Bus) and SATA (Serial Advanced Technology Attachment) are used for peripheral devices, keyboards and modem devices (i.e external buses).
