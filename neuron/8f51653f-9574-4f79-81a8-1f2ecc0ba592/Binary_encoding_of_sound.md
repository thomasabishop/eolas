---
tags: [sound, binary, analogue]
created: Friday, December 27, 2024
---

# Binary encoding of sound

Sound is a change in air pressure.

To record sound, we convert the change in air pressure into an electrical signal
by means of a microphone. Effectively, the same natural waveform is converted
from one medium (the vibration of air molecules) into another medium (electrical
charge in a field) whilst retaining the same morphology. See
[Recording and processing sound]().

The resulting electrical signal is analogue: it has a continuous and variable
frequency and amplitude and thus can have any value at any given moment.

To encode this information digitally we need to make the continuous analogue
single discrete, so that it can represented with a finite set of symbols (bits).

This process is known as **quantization** and consists in sampling the analogue
waveform. This means taking a measurement of it at different points in time -
each second.

CDs sample the audio source at a rate of 44.1 kHz: 44, 100 measurements of the
signal per second.

The measurements are then stored in a digital format: bits. The amount of bits
used to record the measurement is the **bit-depth**. Each measurement is rounded
to the nearest available digital value. CDs have a depth of 16 bits. Thus each
measurement can be one of $16^2 = 65,536$ possible values.

With sampling at a given bit-depth established, the **bitrate** can be derived.

This is the sampling rate (number of measurements per second) divided by the
number of bits per sample (bit-depth), multiplied by the number of channels.

Thus for stereo CDs this is:

$$
(44100 / 16 ) \middot 2 = 1411200
$$

Or 1.4 Mb/s

> Even with a high bitrate (as with CDs) the process still necessarily involves
> a loss of information when converting sound from analogue to digital. However,
> given a high enough value for the sampling rate and bit-depth, the differences
> are imperceptible to the human ear.
