---
tags: [encryption, cryptography]
created: Friday, December 20, 2024
---

# bbdcb54f_public_key_cryptography

_A_ wants to send a message to _B_. A wants to ensure that only _B_ can read the
message and that it is not intercepted or altered during transmission to _B_.

Think of _B_ as being in possession of a letterbox. The letterbox contains
messages that only he can read. Anyone can put letters in it for _B_ to read but
_B_ alone can read them.

This is achieved by encyrpting the messages with two keys: a public key and a
private key. The public key can be shared with others and anyone in possession
of the public key can encrypt a message for _B_. Once encrypted, only _B_ can
decrypt it using his private key. Once receiving the message, B uses his private
secret key - that he doesn't share with anyone else - to decrypt. This is the
equivalent to opening up the letterbox and taking out the letters.

Another useful analogy is to think of invisible ink. Anyone can write a letter
using the invisible ink but only the recipient has the liquid that can render it
visible again. Anyone intercepting the message (without the liquid) will see
nothing, equivalent to the encrypted data.

This is asymmetric encryption because the two communicating parties do not have
equal access to the messages exchanged. _A_ can only send messages - he can't
decrypt them, only _B_ can. So _A_ is unequal relative to _B_. With symmetric
encryption _A_ and _B_ would both share a single private key which they would
each use to encrypt and decrypt their messages.
