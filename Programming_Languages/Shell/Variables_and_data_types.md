---
categories:
  - Programming Languages
tags:
  - shell
---

## Types

## Variables

We use the equality symbol to create a variable:

```bash
stringVar="My first variable"
floatVar="50.3"
boolVar="true"
```

As there is no typing in bash, the names of these variables are purely notional.

To invoke a variable we use special brackets:

```bash
echo ${stringVar} # My first variable
echo ${floatVar} # 50.3
echo ${boolVar} # true
```

- Quotation marks at declaration are also not strictly necessary however they can help avoid bugs. Also serves as a reminder that every type is basically a string at the end of the day

## Parameter expansion

// TODO: What is the difference betweeen `$var`, `${var}` and `"${var}"` ?

Still not very clear on this.
