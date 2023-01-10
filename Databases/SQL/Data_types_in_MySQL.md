---
categories:
  - Databases
  - Programming Languages
tags: [SQL, relational-database]
---

# Data types in MySQL

An understanding of the differences between data types is important because it obviously affects the amount of memory the database uses.

## Numeric

### Integer (`INT`)

- No fractional part, fixed number of digits
- `TINYINT`, `BIGINT` etc are all instances of `INT`, the difference is the size of the number stored.

### Fixed point (`DECIMAL`)

Contains decimal point. Use when accuracy is more important that representing very large or very small values. Hence you would use this for monetary amounts.

### Floating point (`FLOAT`)

Contains decimal point. Use when the ability to represent very large and very small values is more important than precision. Hence you would not use this for monetary amounts.

## String

### Fixed-length character strings ()

Spaces are stripped in storage but represented with a character set.

An example would be `CHAR(10)` or `CHAR(3)`. Here we set the upper limit but it must be the case that no string exceeds it. For either of these, if you add a value that is, e.g, two characters in length, it will add spaces to pad it out and make up the upper limit.

### Variable-length character strings

As above but allowing for variable-length strings.

A common example is `VARCHAR(255)`. The 255 refers to the maximal character length, not the byte length. We must put `255` as the parameter even if our character lengths will be below this but where we don't know the minimum and maximum length.

## Large object storage

### Blob

For storing images, audio and other binary media.
Variants: `TINYBLOB`, `BLOB`, `MEDIUMBLOB` `LONGBLOB`

### Text

Like blob but has character set
Variants: `TINYTEXT`, `TEXT`, `MEDIUMTEXT`, `LONGTEXT`

## Date and time

- `DATE`
- `DATETIME`
- `TIMESTAMP`

## Speciality

### Enumerations

- `ENUM`: a single value from a list
- `SET`: several values from a list

## Storage limits

Each row can have a maximum of 65,535 bytes.
