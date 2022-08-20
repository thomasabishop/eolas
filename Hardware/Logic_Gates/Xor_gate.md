---
categories:
  - Computer_Architecture
  - Electronics
  - Hardware
tags: [logic-gates, binary]
---

# XOR gate

 > `XOR` stands for **exclusive or**, also known as **exclusive conjunction**. This means it can only be `true` if one of its propositions are `true` . If both are `true` this doesn't exclude one of the propositions so the overall statement has to be `false` . This is the only change in the truth conditions from `OR` .

![Pasted image 20220319173834.png](../../img/Pasted_image_20220319173834.png)


````
p    q   p xv q
_    _   ________

t    t     f      (1)
t    f     t      (2)
f    t     t      (3)
f    f     f      (4)  
````