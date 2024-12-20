---
tags: [cryptography]
created: Friday, December 20, 2024
---

# a4601796_trapdoor_functions

How does [public key cryptography](./bbdcb54f_public_key_cryptography.md)
achieve the feat of making the encyrpted data only decipherable in one
direction. In other words how come the same data can be encrypted with one key
but only decryptable by another?

It is acheived by the use of **trapdoor functions**. These are functions that
are easy to compute in one direction but extremely difficult to reverse. But
they also contain trapdoors which, if known, make the functions trivially easy
to compute in both directions.

The public key holder can compute the encryption but only the private key holder
has the trapdoor that makes reversing the encryption trivial.

As an example we can look at a common method for generating trapdoor functions
using prime numbers.

First we need to convert the message into numerical form. One way would be to
convert the characters to their ASCII numbers. These numbers then become input
into the mathematical encryption function.

Next we would pick two very large prime numbers. Using RSA-like encryption they
would be need to be 2048+ bits in length. For the example we will use 17 and 23.

For simplicity let's say that our message is one character equivalent to `5` in
ASCII. We multiply our two primes to get 391 (17 x 23 = 391) and then find the
remainder of: our message cubed and divided by the prime sum. This is `125`
(`5^3 / 391`) which is now our encrypted message which we send.

Unless you know the two primes which were used, it is extremely difficult and
time consuming to reverse the calculation and find the factors that would get
you back to the starting point (remember the numbers will be much larger in
reality). The owner of the private key knows these primes however, so can do
this.
