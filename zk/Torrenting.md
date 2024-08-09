---
title: Torrenting
tags: [question, networks]
created: Saturday, August 03, 2024
---

# Torrenting

**What is torrenting? Is this the same thing as a peer-to-peer network? How do
these technologies fit within the client-server paradigm?**

Torrenting is a specific application of
[peer_to_peer_networking](Peer_to_peer_network.md) applied to file-sharing.

Each peer on the network both consumes resources and makes resources available
to others.

## Procedure

Large files are divided into small equal sized pieces and each piece is assigned
a unique hash identifier. The `.torrent` file details the number of pieces,
their sizes and hash values.

Clients request different pieces from different peers simultaneously. As pieces
are received, they are verified against their hash. Corrupted or incorrect
pieces are discarded and re-downloaded.

The client software reassembles the pieces in the correct order and the final
file will be identical to the original which can be verified by comparing
hashes.

## Key terms

- _tracker_
  - a server that coordinates communication between peers (so there is a server
    but its role is more lightweight than client-server, coordinating the peers
    rather than hosting or distributing file content)
- _swarm_
  - a group of peers sharing the same file
- _seeding_
  - uploading file pieces to other peers
- _leeching_
  - downloading file pieces from other peers

> An alternative to a tracker server is to use trackerless methods such as
> distributed hash tables

## Terminological clarification

- _BitTorrent_ is the communications [protocols](Network_protocols.md) for P2P
  file sharing. It was also a client software developed by the company
  BitTorrent Inc.

- _torrenting_ is the general terms for that act of sharing files using the
  BitTorrent protocol

## Napster

Napster pre-dated the emergence of the BitTorrent protocol. It did not segment
files and files were downloaded directly from peers. It was a centralised P2P
network because there was a central server that indexed all available files
which kept a database of all connected users and their files.

When you searched Napster you would be querying this DB on the server. The
server would facilitate a direct connection between the consumer and provider
peer for the data exchange.

When users share with BitTorrent the `.torrent` file is the source of truth and
a swarm is created around the users who have possess the file.
