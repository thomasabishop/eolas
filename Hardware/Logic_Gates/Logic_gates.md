---
tags:
- Logic
- Electronics
- Hardware
- logic-gates
---

# Logic gates

Logic gates are the basic building blocks of digital computing. **A logic gate is an electrical circuit that has one or more than one input and only one output.** The input controls the output and the logic is isomorphic with [Boolean connectives](../../Logic/Truth-functional_connectives.md) defined in terms of [truth-tables](../../Logic/Truth-tables.md).

### Truth tables

Truth-tables present the conditions under which logical propositions are true or false. To take the `AND` operator: `AND` evaluates to `true` if both of its constituent expressions are `true`, and `false` in any other circumstances (e.g. if one proposition is `true` and the other `false` (or vice versa) and if both propositions are `false` ).

This is most clearly expressed in the following truth table:

**Truth table for `AND`**

````
p    q   p & q
_    _   _____
t    t     t
t    f     f
f    t     f
f    f     f   
````

 The negation operator (`¬` or `~` ) switches the value of a proposition from true to false. When we put `~` before `true` it becomes false and when we put `~` before `false` it becomes `true`. We will see shortly that this corresponds to a basic on/off switch.

**Truth table fo `NOT`**

````
p    ~ p
_    __
t    f
f    t
````

## `AND` gate

Just as we can create `NOT` logic from a NAND gate, without the `AND` conditions, we can create a circuit that exemplifies the truth conditions of `AND` without including those of `NOT`.

When we attach two NAND gates in sequence connected to two switches as input this creates the following binary conditions:

````
A    B   Output
_    _   _____

0    0     0       (1)
1    0     0       (2)
0    1     0       (3)
1    1     1       (4)
````

Which is identical to the truth table for `AND` :

````
p    q   p & q
_    _   _____

t    t     t      (1)
t    f     f      (2)
f    t     f      (3)
f    f     f      (4)  
````

### Natural language

 > 
 > `AND` (`&`) is `true` when both constituent propositions are `true` and `false` in all other circumstances viz. `false false` (`¬P & ¬Q` / `0 0` ), `true false` (`P & ¬Q` / `1 0` ), `false true` (`¬P & Q` / `0 1` )

AND at 0 0

![Screenshot_2020-08-25_at_15.04.10 1.png](../img/Screenshot_2020-08-25_at_15.04.10%201.png)

AND at 1 0 or 0 1
![Screenshot_2020-08-25_at_15.05.20.png](../img/Screenshot_2020-08-25_at_15.05.20.png)

![Screenshot_2020-08-25_at_15.05.36.png](../img/Screenshot_2020-08-25_at_15.05.36.png)

### Symbol for `AND` gate

It's very similar to NAND so be careful not to confuse it

![Pasted image 20220319173651.png](../img/Pasted%20image%2020220319173651.png)

### `OR`

 > 
 > `OR` (in logic known as **disjunction**) in its non-exclusive form is `true` if either of its propositions are `true` or both are `true` . It is `false` otherwise.

![Pasted image 20220319173819.png](../img/Pasted%20image%2020220319173819.png)

````
p    q   p V q
_    _   _____

t    t     t      (1)
t    f     t      (2)
f    t     t      (3)
f    f     f      (4)  
````

### `XOR`

 > 
 > `XOR` stands for **exclusive or**, also known as **exclusive conjunction**. This means it can only be `true` if one of its propositions are `true` . If both are `true` this doesn't exclude one of the propositions so the overall statement has to be `false` . This is the only change in the truth conditions from `OR` .

![Pasted image 20220319173834.png](../img/Pasted%20image%2020220319173834.png)

Electrical symbol for XOR

````
p    q   p X V q
_    _   ________

t    t     f      (1)
t    f     t      (2)
f    t     t      (3)
f    f     f      (4)  
````

### `**NOR**`

 > 
 > This is equivalent to saying 'neither' in natural language. It is only `true` both propositions are `false` . If either one of the propositions is `true` the outcome is `false` . If both are `true` it is `false`

![Pasted image 20220319173900.png](../img/Pasted%20image%2020220319173900.png)

### `XNOR`

 > 
 > This one is confusing. I can see the truth conditions but don't understand them. It is `true` if both propositions are `false` like `NOR` or if both propositions are `true` and `false` otherwise.

````
p    q   p ¬V q
_    _   ________

t    t     f      (1)
t    f     f      (2)
f    t     f      (3)
f    f     t      (4)  
````

````
p    q   p X¬V q
_    _   ________

t    t     t      (1)
t    f     f      (2)
f    t     f      (3)
f    f     t      (4)  
````
