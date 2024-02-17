---
tags: [nand-to-tetris]
---

# Hardware abstraction and modularity

In computer architecture we deal with complexity by breaking the system into
**modules**. For each module we distinguish **_abstraction_** from
**_implementation_**.

<dl>
  <dt>abstraction</dt>
  <dd>what the module does</dd>
  <dt>implementation</dt>
  <dd>how it does it</dd>
</dl>

When using a module as a building block you are to focus exclusively on the
module's abstraction, ignoring completely its implementation details.

> The abstraction-implementation paradigm helps developers manage complexity and
> maintain sanity: by dividing an overwhelming system into well-defined modules
> we create manageable chunks of implementation work and localize error
> detection and correction.

[N.Nisan, S.Schoken. 2021. **The Elements of Computing Systems** (Second
Edition)]

The design of the diagram below emphasises the role of abstraction and
modularity in the movement from transistors to chips:

![](/img/hardware-abstraction-hierarchy.png)
