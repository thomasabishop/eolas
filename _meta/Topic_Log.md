# Learning Topic Log

## Python

- Research: best practice for separating projects into `conda` environments like npm

- Read-up more on types: what does it mean for Python to be dynamically typed. What is type-hinting really?

  - Use provided pdfs and John's books

- Is `dictionary.values()`/ `dictionary.keys()` of type list?
- Is `dictionary.items()` a list of tuples for key, value?

- How to run test suites via VSCode?

  BBC Course, remaining topics:

  - Classes and object-oriented paradigms in Python
  - Modules
  - Error handling
  - Testing
  - I/O

## Bash

- Best way to run a command in a script - is it to `echo` it?
- How to handle the return value of a command
  - If it returns multiple values, how to isolate and loop through them
- ~~What the weird variable symbols mean like errors and stuff~~
- ~~Read up properly about `find` and `read`~~
- `.list` file extension
- Error handling
- ~~Splitting strings~~
- Awk
  - https://dane-bulat.medium.com/the-awk-programming-language-an-introduction-7035d343cd30
- Why do we have to do `"$var"` instead of `$var` or `${var}` at times
- The `test` program (does it actually use the word 'test' or is this implicit?) and its use of `-z` and and `-e` flags

## Linux

- `/dev/null` in greater depth

## SQL

- What is a _schema_ in MySQL/ SQL ?
- Proper definition of "migrating a database"?

## GraphQL

- What is a transformer?

## AWS

- Start reading more specifically about key services: Lambda, step functions, CloudFormation, Elasticache, CloudFront, CloudWatch
- Do basic exercises from Amazon on aspects I am interested in to get a practical feel for it
- Elastic Beanstalk and how it differs from using multiple different services at once
- AWS Amplify
- Deploy my own website on AWS

## NodeJS

- Build examples of read stream and write stream
- Can you override parent class methods in JS subclass?
  - If not in JS, can you do this in TS?

## Git

- What is rebasing?
- What is cherry-picking?
- GitFlow methodology in the context of releases, hotfixes etc
- How can you rollback without a hard-reset, i.e. how can you keep the future state (from the point of view of the rolled-back branch) accessible?
- Tagging (also in relation to Git flow)
- See if there is an advanced Git course on LinkedIn

## JavaScript

Look into these new features:

- Proxy object
- `Object.hasOwn()`
- Top level `await`
- `Error.Prototype.cause()`
- Dynamic import
- Temporal
- `Promise.allSettled()`, `Promise.any()`
