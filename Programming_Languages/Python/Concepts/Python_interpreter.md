---
title: Python interpreter
categories:
  - Programming Languages
tags: [python]
---

# Python interpreter

## What is an implementation of a programming language?

An implementation of Python:

> means a program or environment which provides support for the execution of programs written in the Python language

As Python is interpreted, any implementation will perforce involve an interpreting language.

There are three main implementations:

- CPython
  - The default implementation, written in C
- Jython
  - Python implemented by Java and running on the JVM
- PyPy
  - A subset of Python which is faster due to machine code compilation

## CPython

In the standard implementation, the language which interprets Python code is C.

When Python runs in this implementation, code written in C converts it to bytecode (so-called because each instruction is [8-bits long](/Hardware/Binary/Binary_units_of_measurement.md)). This is a lower-level transliteration of Python is not meant to be understood by the CPU (since it is not binary) but rather to be run in the Python virtual machine which is equipped to understand bytecode. The Python Virtual Machine is therefore also known as "bytecode interpreter" or the CPython VM. The VM then converts bytecode into machine-executable code.

The fact that Python does not compile to binary means that it can run on a greater variety of hardwares however it is slower than a language that compiles to machine code. PyPy is a solution for this because it is both interpreted and compiled to optimised machine code at run time.

Where CPython is the interpreter, Python extensions can be written in C.

## PyPy

PyPy is an alternative implementation to CPython. The main difference is that it uses a JIT-compiler and doesn't convert Python to the intermediary byte code. It is also written in Python itself, specifically RPython ('restricted Python'). This is capable of converting Python directly to machine code without the CPython virtual machine.

## Jython

Jython is an implementation of Python written in Java. Like CPython it converts Python to bytecode but this runs on the JVM. As it is written in Java, a Jython program can import and use any Java class.

Where Jython is the interpreter, Python extension can be written in Java.
