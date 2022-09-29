---
title: Child to parent data-flow
categories:
  - Programming Languages
tags: [javascript, react, react-hooks]
---

# Child to parent data flow

Despite React having a uni-directional, downwards data-flow, it is sometimes necessary to pass events and data from a child back up to the parent. This need can arise when you want to modularize functionality within a child component rather than have everything happening in the parent, and you don't want to use a common shared higher context.

For the example we will use the standard click incrementer.

We have a counter on the parent that is updated in response to a click event in the child component.
