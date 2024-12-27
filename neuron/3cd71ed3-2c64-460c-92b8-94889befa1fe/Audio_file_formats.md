---
tags: [sound, binary]
created: Friday, December 27, 2024
---

# Audio file formats

## CD

- CDs store audio in uncompressed PCM (Pulse Code Modulation) format
- They have a sampling rate of 44.1kHz
- In two channels for stereo

## WAV: Waveform Audio File Format

- CD-quality encoding with no compression
- Bit-for-bit identical to the CD source
- Historically developed for Windows machines but can play on all operating
  systems

## FLAC: Free Lossless Audio Codec

- Basically the same as WAV but in a (losslessly) compressed format
- The difference between a novel in a text file (WAV) and as a zipped file

## MP3: MPEG-1 Audio Layer MP3

- Lossy format.
- When a WAV file (or other lossless format) is converted to MP3 a Fast Fourier
  Transform analysis is performed to determine the frequency of certain sounds.
- This is used by the encoder to decide which parts of the sound are
  imperceptible and thus which can be discarded to reduce the file size. This is
  done through the application of psycho-acoustic models.
- The remaining data is then compressed
- Examples of the data reduction applied:
  - Removing frequencies that humans cannot hear
  - Removing quieter sounds that are masked by louder sounds
  - Combining similar frequencies
  - Reducing stero information where it is less noticable
- A conversion to MP3 from, for example, a CD source is always a one-way process
  and is not reversible. Once information is discarded in the compression
  process it cannot be retrieved. This is obviously in contrast to lossless
  methods like FLAC where the original CD audio can always be reconstructed.
- It follows from the above that if you repeatedly encode a CD source to MP3, it
  will deteriorate in quality since more data is being removed each time.

## OGG: Ogg Vorbis

- An open-source alternative to MP3
- Typically achieves better quality than MP3 at the same bit rate, especially at
  very high/ low frequencies
- Also better stereo handling at low frequencies
- Uses a more modern psycho-acoustic model

## Variable and constant bit rates

For lossy formats like MP3, the amount of data that is being encoded from the
uncompressed source is expressed via the unit of "bit rate": **how many
thousands of bits are being used to represent each second of audio**.

There are two methods of encoding that impact on the bit rate.

With _variable bit rate_ encoding, the encoder dynamically adjusts the bit rate
depending on what is happening in the music. During complex passages (e.g. a
full orchestra) it uses a higher bit rate to capture the detail. During simpler
passages (like a single instrument) it uses lower bit rates since less data is
needed and during silence it can drop to very low bit rates.

_Constant bit rate encoding_ uses the same bit rate throughout, it is
consequently less efficient.

When talking about the quality of MP3s there are generally two bit rates cited:

- ~128kbps: acceptable but significantly reduced
- 320kbps: the highest quality you can get whilst still using a lossy method
  like MP3

With VBR, these are sometimes expressed as an average.

Subjectively, A 128kbps MP3 might sound "underwater" or "swishy", while a
320kbps version would preserve much more detail.

Still, the bitrate of a CD is 1411kbps! A 128kbs MP3 is therefore only capturing
about 9% of CD quality and a 320kbps MP3 is capturing about 23% of CD quality.

## Streaming services

Spotify uses Ogg Vorbis throughout but uses different bit rates for its diferent
tiers. The free tier has a range from 24-160kbs at VBR with the option of 320kbs
on the premium tier.

Other services offer FLAC or FLAC-equivalent quality at their most expensive
tiers (Apple Music, Amazon Music, Tidal).

Og Vorbis is particularly well-suited to streaming. It can seamlessly switch bit
rates during the stream which is beneficial with changeable network conditions.
Plus data is organised into independent packets so if a packet is lost there is
no perceptible difference.
