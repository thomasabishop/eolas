---
tags: [networks, internet]
created: Tuesday, November 12, 2024
---

# Usenet

A decentralised system of computer servers that allowed users to post messages
to topic-based discussion groups called "newsgroups" which other users could
read and reply to.

Arguably the first social network and the oldest internet network that is still
operational.

It was designed by staff at two separate universities. Both used Unix systems
and wanted a way to communicate with each other.

## Technology

Usenet comprised a [distributed network](385af4b4_Baran_distributed_networks.md)
of dedicated servers that exchanged messages over the **Network News Transfer
Protocol** (NNTP).

A user would post a message to their local news server. The server would assign
it a UUID and then share it with other peer servers that it was connected to,
who would also share it, repeating the process. This created a ripple effect
that would propagate the message over the global network. Because of the
distributed nature of this network it meant that messages would have a high
longevity and retention rate and that it was effectively impossible to delete a
message once posted, since it would be stored across a multitude of servers.

## Relation to the Internet

Usenet developed separately and in parallel with the Internet. Originally it did
not operate over the Internet: servers would connect to each other over phone
lines using the Unix-to-Unix Copy Protocol. In the late 1980s when the Internet
became more widespread and not just limited to DARPA-adjacent universities,
Usenet transitioned to running over
[TCP/IP](Transport_Layer_of_Internet_Protocol.md) networks.

## Newsgroup hierarchy

Usenet used a structured, dot-separated naming system for newsgroups that got
more specific with each subdivision, e.g:

- comp.sys.mac
- sci.physics.particle
- alt.music.nirvana

Users would subscribe to the newsgroups that interested them and their
newsreader (which connected to the servers) would only download messages from
these groups.

## Influence

- Created the concept of threaded discussions in its reply structure
- Reddit appropriated the concept of topic-based communities in its sub-reddits
  and also used threading
- RSS adopted Usenet's model of subscribing to specific information sources and
  getting updates: the concept of "pulling" new content from feeds mirrors how
  newsreaders worked
- Distributed social networks like Mastodon/ActivityPub use a similar
  server-to-server propagation model that Usenet pioneered
- [BitTorrent's](Torrenting.md) distributed file-sharing model has similarities
  to how binary files were distributed across Usenet servers

## "Eternal September"

For most of its early history Usenet was limited to university students whose
university was part of the network. Each September new students would join the
university and this led to an influx of inexperienced Usenet users who didn't
yet know the etiquette and culture. They would have to be schooled and inducted.

In the mid-1980s Usenet became accessible to the general public as ISPs started
granting access. In 1993-1994, AOL granted access to subscribers. This changed
the nature of discussions from primarily academic and technical topics to
include more general interest and entertainment content, leading to the creation
of the "alt." hierarchy which allowed anyone to create new newsgroups without
formal approval processes that were required in the traditional hierarchies.
Hence it was "always September".

This phrase is often used as a shorthand for the way in which the Internet and
Web has moved from a niche community of technical users to a demotic public
space with an attendant decline in perceived value.
