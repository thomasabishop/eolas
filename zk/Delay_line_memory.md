---
title: Delay_line_memory
tags: [computer-history, memory]
created: Wednesday, September 18, 2024
---

# Delay line memory

- First described in the _First Draft_ by #vonNeumann based on work by Eckert
  and Mauchley.

- Information is stored as acoustic waves travelling through a medium, typically
  mercury. As sound travels more slowly than electric charge (light), if
  electric signals are converted to sound, the delay time involved can be used
  as a type of store.

- It worked as follows:
  - Imagine we have an 8-bit number. The number is input as a sequence of pulses
    where a pulse is 1 and the absence of a pulse is 0.
  - The pulses are converted into sound waves (using a transducer, as with a
    speaker) and sent through a mercury-filled tube.
  - The length of the tube is calculated so that it takes exactly the time of
    one machine cycle for a pulse to travel from one end to the other
  - At the other end of the tube, another transducer converts the sound waves
    back to electrical pulses
  - This operates in a loop: the pulses go back into the input end of the tube
    and the cycle runs again.

To read the data, the computer would "listen" to the pulses coming out of the
receiving end. To write new data, the computer would inject new pulses at the
precise moment when it wants to change a '0' to a '1' or vice versa.

For an 8-bit number there would be 8 pulses for each bit and it would be
necessary to keep track of 8 specific positions in the delay line where each bit
would be stored.

The limitations were timing - difficult to keep track of each precise bit and
when it would arrive at the output. Also it was sequential rather than random
access. Not every bit could be accessed at once, you had to wait for its time
slot to come around to access it.
