---
tags: [networks, internet]
created: Friday, August 16, 2024
---

# IP addresses

## IPv4 vs IPv6

IP addresses come in two formats and bit-lengths depending on which version of
the [Internet Protocol](Internet_Layer_of_Internet_Protocol.md) is being used.

- IPv4 addresses are 32-bits in length
- IPv6 addresses are 128-bits in length

The larger the bit-length, the more unique addresses that can be generated. Thus
IPv6 can create more addresses that IPv4.

This entry focuses on IPv4 addresses.

## Anatomy of an IPv4 address

Each of the 32 bits are divided into four groups which are each 8 bits in
length. Each group therefore comprises an octet and is separated by dots.

The decimal number system, rather than binary is used to represent the values.
This means each binary octet is three decimal digits in length.

The 32 bits comprise two major groupings

- the **network prefix**
- the **host**

![Different sections of IP address](static/ip-address-anatomy.png)

Devices connected to the same network share the same network prefix. They are
said to be on the same **subnet**. However each device will have a unique value
for the host octet.

(This account is somewhat idealised. The length of the prefix does not always
align with the octet boundary. For instance, the prefix could be 25 bits in
length, rather than 24. In this case it would "steal" one bit from the host
section making it 23 bits in length.)

Any changes to the length of the network prefix change the number of hosts
available on the subnet. If the network prefix is longer, the number of unique
hosts is reduced. If the network prefix is shorted, the number of unique hosts
is increased.

## Identifying the network and host groupings

Given that the network prefix and host identifier do not always stick to set
boundaries, we require a way of distinguishing the two values. There are two
dominant methods.

### CIDR notation

This stands for _Classless Inter-Domain Routing_. An example:

> 192.168.1.23/24

The value after the forward slash is the number of bits that specify the network
address. In the example, it is the standard 24-bits. Thus 192.168.1.23 stands
for the network.

### Subnet masking

The subnet mask is another number _in addition to_ the network address. It is a
kind of superimposed map on top of the address.

Here is an example of a subnet mask:

> 11111111.11111111.11111111.00000000

The denary form would be as follows (as 255 is the maximal decimal number that
can be represented with a single 8-bit number and 0 is the smallest):

> 255.255.255.0

In the binary form, the 1 values represent the bits which designate the network
address and the 0 values represent the bits that designate the host.

In the example above this corresponds to the idealised 32-bit:8-bit ratio of
CIDR /24.

There is a clever consequence of the subnet mask: if you apply a bitwise AND
operator against the IP address and mask (both in their binary form) you can
determine whether two addresses are on the same network.

To compare the IP address 192.168.1.23 against 192.168.1.100 to demonstrate:

```
192.168.1.23:
IP:     11000000.10101000.00000001.00010111
Mask:   11111111.11111111.11111111.00000000
Result: 11000000.10101000.00000001.00000000
___________________________________

192.168.1.100:
IP:     11000000.10101000.00000001.00010111
Mask:   11111111.11111111.11111111.00000000
Result: 11000000.10101000.00000001.00000000
```

After applying the bitwise AND logic we see that the result is identical for
both IPs indicating they are on the same network (share the same network
prefix), whilst the host value is "masked".

Here is a scenario where the subnet mask indicates that two IPs are not on the
shared network:

```
192.168.1.23:
IP:     11000000.10101000.00000001.00010111
Mask:   11111111.11111111.11111111.00000000
Result: 11000000.10101000.00000001.00000000
___________________________________

192.168.2.1
IP:     11000000.10101000.00000010.00000001
Mask:   11111111.11111111.11111111.00000000
Result: 11000000.10101000.00000010.00000000

```

255.255.255.0 is not the only possible subnet mask. There are masks
corresponding to ratios other than CIDR /24. For example:

- 255.0.0.0 (/8)
- 255.255.0.0 (/8)
- 255.255.255.192 (/26)
- 255.255.255.240 (/28)

As noted previously, the different ratios will obviously affect the number of
unique hosts available on the subnet.

## Determining the range of hosts: practical example

Let's say we have the following IP address expressed in CIDR: 192.168.0.133/27.
In binary this would be:

```
110000000.10101000.00000000.100--00101
```

The `--` indicates the demarcation point between the network prefix and the bits
designated for the host. 32 - 27 leaves us 5 bits for our range of hosts. This
gives us 2^5 = 32 unique host values.

In fact it will actually be 30 values since the first value (`00000`) will be
used to identify the network itself and the last value (`11111`) will be the
broadcast address - the address used when a message needs to be sent to all
hosts on the network.

An actual host address in this range is included in the example: `00101`.
