---
title: Analogue and digital
categories:
  - Hardware
tags: [analogue]
---

# Analogue and digital

Analogue and digital are paradigms for recording information, specifically
information about an object or state that obtains in the world.

![](/img/analog-digital.svg)

## Analogue

Here are two examples of analogue measurement/ capture:

- Measuring the temperature of a room with a mercury barometer
  - The mercury in the barometer expands or contracts in response to the heat of
    the ambient environment.
  - We say that the position of the mercury relative to the container represents
    the current temperature
- Measuring the weight of an object by placing it on a weighing scale
  - We say the position of the needle on the scale represents the weight of the
    object

> In each case, the position of the needle or the mercury isn't actually the
> temperature or the weight, it is a representation of this property. Thus in
> both cases, the analogue device works by analogy hence why we call it
> analogue.

This isn't the only sense in which "analogue" is used however. It doesn't always
mean an analagous representation of a physical property. We talk about
**analogue signals** as signals that vary continuously and which do not align to
digital values.

## Digital

### Limitations of analogue for computation

From a computing point of view, the data that can be captured and recorded by
analogue devices is simply too diverse and non-uniform. Computers are universal
machines whereas analogue devices typically only measure one property well.
Whereas a computer can record and playback music and take the temperature, to do
this in an analogue way would require a complex machine that can represent two
unrelated data sources. Imagine if a computer was able to achieve universality
through analogue means, it would most likely be very large physically and very
complex computationally since the computer would need to be able process data
from, e.g. for grooves on vinyl, needles on weighing sensors and mercury in
vacuum tubes.

> The types of analogue systems used are so different and variable that creating
> a common computing device that can understand all of them is nearly
> impossible.

Furthermore:

> Computers require highly reliable and accurate representations of certain
> types of data. Analogue representations of data can be difficult to measure
> precisely (and are potentially infinite), tend to decay over time, and lose
> fidelity when copied.

**Computers need a way to represent all types of data in a format that can be
accurately processed, stored and copied.**

### Why digital is better suited to computational requirements

A digital system represents data as a sequence of symbols where each symbol is
one of a limited set of values.

Computers only use two symbols for each value: 0 and 1.

Although a digital system could use more than two symbols, adding more would
[increase the complexity](Why_computers_use_binary.md#from-circuits-to-programs)
and cost of the system. A set of only two symbols allows for simplified hardware
and improved reliability.

All data within a computer from images to sounds are sequences of 0s and 1s. In
practice, the sequences are stored in various ways. On a CD, the binary digits
are stored as bumps (0) or flat spaces (1). On a flash drive, the 1s and 0s are
electrical charges etc.
